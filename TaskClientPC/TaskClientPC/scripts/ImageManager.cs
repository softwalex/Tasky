using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskClientPC.ImageTaskyServiceReference;

namespace TaskClientPC.scripts
{
    public static class ImageManager
    {
        private static string _iageDirectory;

        public static string ImageDirectory
        {
            get { return _iageDirectory; }
            set { _iageDirectory = value; }
        }



        public static void GetImageFromService(string fileName)
        {
            I_ImageServiceClient service = new I_ImageServiceClient();
            byte[] imageArray = service.GetImage(fileName);

            var stream = new MemoryStream(imageArray);
            System.Drawing.Image img = System.Drawing.Image.FromStream(stream);

            img.Save(ImageDirectory+fileName);
        }


    }
}
