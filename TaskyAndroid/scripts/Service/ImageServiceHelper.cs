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
                _endpointAddress = "http://10.0.2.2:8733/Design_Time_Addresses/WcfService/ImageUserService/";
            }
            else
            {
                _endpointAddress = "http://localhost:8733/Design_Time_Addresses/WcfService/ImageUserService/";
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
        public async void SaveImageToService(ImageSource imageSource, string name)
        {
            ImageServiceHelper<I_ImageService> imageService = new ImageServiceHelper<I_ImageService>();
            if (imageSource is StreamImageSource streamImageSource)
            {
                using Stream stream = await streamImageSource.Stream.Invoke(new CancellationToken());
                using MemoryStream memoryStream = new MemoryStream();
                await stream.CopyToAsync(memoryStream);
                byte[] arr=memoryStream.ToArray();

                await imageService.CallServiceAsync(client => client.SaveImageAsync(arr, name));
            }
        }
    }
}

