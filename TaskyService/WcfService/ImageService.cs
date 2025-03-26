using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace WcfService
{
    public class ImageService : I_ImageService
    {
        public byte[] GetImage(string fileName)
        {
            string localPath = Path.GetFullPath(Path.Combine(Environment.CurrentDirectory, @"..\..\..\"));
            string path = Path.GetFullPath(localPath+ "/ViewModel/TaskImages/"+ fileName);

            byte[] imageArray = File.ReadAllBytes(path);
            return imageArray;

        }

        public void SaveImage(byte[] imgeArray, string fileName)
        {
            Stream stream = new MemoryStream(imgeArray);
            System.Drawing.Image img = System.Drawing.Image.FromStream(stream);

            string localPath = Path.Combine(Environment.CurrentDirectory, @"..\..\..\");
            string path = Path.Combine(localPath, "/ViewModel/Images/", fileName);

            img.Save(path);

        }
    }
}
