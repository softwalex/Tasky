using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace WcfService
{
    [ServiceContract]
    public interface I_ImageService
    {
        [OperationContract]
        byte[] GetImage(string fileName);

        [OperationContract]
        void SaveImage(byte[] imgArray, string fileName);
    }
}
