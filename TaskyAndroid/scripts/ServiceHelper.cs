using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace TaskyAndroid.scripts
{
    public class ServiceHelper<T> where T : class
    {
        private readonly string _endpointAddress;
        public ServiceHelper()
        {
            if(DeviceInfo.Platform == DevicePlatform.Android)
            {
                _endpointAddress = "http://10.0.2.2:8733/Design_Time_Addresses/WcfService/UserService/";
            }
            else
            {
                _endpointAddress = "http://localhost:8733/Design_Time_Addresses/WcfService/UserService/";
            }
        }
        private ChannelFactory<T> CreateChannelFactory()
        {
            var binding = new BasicHttpBinding  // עם הגדרות מתאימות binding יצירת
            {
                MaxBufferSize = 65536, // גודל החוצץ המרבי שניתן לקבל
                MaxReceivedMessageSize = 65536, // גודל ההודעה המרבי שניתן לקבל
                Security = new BasicHttpSecurity
                {
                    Mode = BasicHttpSecurityMode.None // (אין שימוש באבטחה (אין הצפנה
                },
                AllowCookies = true //HTTP מאפשר שימוש בעוגיות עבור בקשות 
            };

            var endpoint = new EndpointAddress(_endpointAddress);     // יצירת אובייקט המייצג את כתובת הקצה של השירות

            return new ChannelFactory<T>(binding, endpoint); // עם ההגדרות שנקבעו ChannelFactory יצירת מופע של
        }
        public async Task<TResult> CallServiceAsync<TResult>(Func<T, Task<TResult>> serviceCall)
        {
            var factory = CreateChannelFactory(); // (ChannelFactory) לקבלת מופע של הלקוח
            var client = factory.CreateChannel();

            try
            {
                TResult result = await serviceCall(client); // קריאה לשירות באמצעות הפונקציה שנשלחה
                ((IClientChannel)client).Close();         // סגירת הערוץ לאחר השלמת הקריאה בהצלחה

                return result;
            }
            catch (Exception ex)
            {
                ((IClientChannel)client).Abort();// במקרה של שגיאה, מבצע ביטול של הערוץ כדי לנקות משאבים

                // זריקת חריגה מותאמת כדי ליידע על השגיאה
                throw new ApplicationException("שגיאה בעת קריאה לשירות WCF.", ex);
            }
        }

    }
}