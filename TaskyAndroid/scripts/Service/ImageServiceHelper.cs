using ImageServer;
using Microsoft.Maui.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace TaskyAndroid.scripts.Service
{
    public class ImageServiceHelper<T> where T : class
    {
        private readonly string _endpointAddress;
        public ImageServiceHelper()
        {
            if (DeviceInfo.Platform == DevicePlatform.Android)
            {
                _endpointAddress = "http://10.0.2.2:8733/Design_Time_Addresses/WcfService/ImageService/";
            }
            else
            {
                _endpointAddress = "http://localhost:8733/Design_Time_Addresses/WcfService/ImageService/";
            }
        }
        private ChannelFactory<T> CreateChannelFactory()
        {
            var binding = new BasicHttpBinding  // עם הגדרות מתאימות binding יצירת
            {
                MaxBufferSize = 2147483647, // גודל החוצץ המרבי שניתן לקבל
                MaxReceivedMessageSize = 2147483647, // גודל ההודעה המרבי שניתן לקבל
                MaxBufferPoolSize = 2147483647,
                ReaderQuotas = new System.Xml.XmlDictionaryReaderQuotas
                {
                    MaxDepth = 2147483647,
                    MaxStringContentLength = 2147483647,
                    MaxArrayLength = 2147483647,
                    MaxBytesPerRead = 2147483647,
                    MaxNameTableCharCount = 2147483647,
                },
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

        public async Task CallServiceAsync(Func<T, Task> serviceCall)
        {
            var factory = CreateChannelFactory();
            var client = factory.CreateChannel();

            try
            {
                await serviceCall(client);
                ((IClientChannel)client).Close();
            }
            catch (Exception ex)
            {
                ((IClientChannel)client).Abort();
                throw new ApplicationException("Error calling WCF service.", ex);
            }
        }

    }

    public class ImageManger
    {
        public async void SaveImageToService(Stream image, string name)
        {
            ImageServiceHelper<I_ImageService> imageService = new ImageServiceHelper<I_ImageService>();
            byte[] arr=null;
            if (image is MemoryStream memoryStream)
            {
                arr = memoryStream.ToArray();
            }
            if(arr==null)
            using (var ms = new MemoryStream())
            {
                image.CopyTo(ms);
                arr = ms.ToArray();
            }
            await imageService.CallServiceAsync(client => client.SaveImageAsync(arr, name));
        }
    }
}

