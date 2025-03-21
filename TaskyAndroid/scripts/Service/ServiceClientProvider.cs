using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Net.NetworkInformation;

namespace TaskyAndroid.scripts.Service
{
    internal class ServiceClientProvider
    {
        private static readonly Lazy<ServiceClientProvider> _instance =
            new Lazy<ServiceClientProvider>(() => new ServiceClientProvider());

        public static ServiceClientProvider Instance => _instance.Value;

        // שני השירותים העיקריים שאנחנו משתמשים בהם
        private UserServer.UserServiceClient _userServiceClient;
        //private ImageServiceReference.I_ImageServiceClient _imageServiceClient;

        // מספק גישה לשירות המשתמשים
        public UserServer.UserServiceClient UserService
        {
            get
            {
                if (_userServiceClient == null ||
                    _userServiceClient.State == CommunicationState.Faulted ||
                    _userServiceClient.State == CommunicationState.Closed)
                {
                    _userServiceClient = CreateUserServiceClient();
                }
                return _userServiceClient;
            }
        }

        // מספק גישה לשירות התמונות
        //public ImageServiceReference.I_ImageServiceClient ImageService
        //{
        //    get
        //    {
        //        if (_imageServiceClient == null ||
        //            _imageServiceClient.State == CommunicationState.Faulted ||
        //            _imageServiceClient.State == CommunicationState.Closed)
        //        {
        //            _imageServiceClient = CreateImageServiceClient();
        //        }
        //        return _imageServiceClient;
        //    }
        //}

        // בנאי פרטי למניעת יצירת מופעים נוספים
        private ServiceClientProvider()
        {
        }

        // יצירת לקוח WCF חדש לשירות המשתמשים
        private UserServer.UserServiceClient CreateUserServiceClient()
        {
            var binding = new BasicHttpBinding();
            binding.Security.Mode = BasicHttpSecurityMode.None;
            binding.MaxReceivedMessageSize = 2147483647;
            binding.MaxBufferSize = 2147483647;
            binding.ReceiveTimeout = TimeSpan.FromMinutes(10);
            binding.SendTimeout = TimeSpan.FromMinutes(10);

            var endpoint = new EndpointAddress("http://localhost:8733/Design_Time_Addresses/ServiceModel/UserService/");
            if (DeviceInfo.Platform == DevicePlatform.Android)
            {
                endpoint = new EndpointAddress($"http://{GetLocalIpAddress()}:8733/Design_Time_Addresses/WcfService/UserService/");
            }
            return new UserServer.UserServiceClient(binding, endpoint);
        }

       private string GetLocalIpAddress()
        {
            string localIP = string.Empty;

            foreach (var networkInterface in System.Net.NetworkInformation.NetworkInterface.GetAllNetworkInterfaces())
            {
                var ipProps = networkInterface.GetIPProperties();
                foreach (var addr in ipProps.UnicastAddresses)
                {
                    if (addr.Address.AddressFamily == AddressFamily.InterNetwork) // Ensure it's an IPv4 address
                    {
                        localIP = addr.Address.ToString();
                        if (!localIP.StartsWith("127.")) // Ignore loopback addresses
                        {
                            return localIP;
                        }
                    }
                }
            }

            return localIP;
        }

        // יצירת לקוח WCF חדש לשירות התמונות
        //private ImageServiceReference.I_ImageServiceClient CreateImageServiceClient()
        //{
        //    var binding = new BasicHttpBinding();
        //    binding.Security.Mode = BasicHttpSecurityMode.None;
        //    binding.MaxReceivedMessageSize = 2147483647;
        //    binding.MaxBufferSize = 2147483647;
        //    binding.ReceiveTimeout = TimeSpan.FromMinutes(10);
        //    binding.SendTimeout = TimeSpan.FromMinutes(10);

        //    var endpoint = new EndpointAddress("http://localhost:8733/Design_Time_Addresses/ServiceModel/ImageService/");

        //    return new ImageServiceReference.I_ImageServiceClient(binding, endpoint);
        //}

        // סגירת החיבורים לשירותים
        public void CloseConnections()
        {
            CloseConnection(ref _userServiceClient);
            //CloseConnection(ref _imageServiceClient);
        }

        // סגירת חיבור ספציפי
        private void CloseConnection<T>(ref T client) where T : ICommunicationObject
        {
            try
            {
                if (client != null)
                {
                    if (client.State != CommunicationState.Faulted)
                    {
                        client.Close();
                    }
                    else
                    {
                        client.Abort();
                    }
                    client = default;
                }
            }
            catch (Exception)
            {
                if (client != null)
                {
                    client.Abort();
                    client = default;
                }
            }
        }
    }
}
