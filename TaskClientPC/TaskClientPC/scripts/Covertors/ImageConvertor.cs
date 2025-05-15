using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Media.Imaging;
using TaskClientPC.scripts;
using TaskClientPC.TaskyServiceReference;

namespace TaskClientPC.Covertors
{
    public class ImageConvertor : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) return null;
            if (value.ToString() == "") return null;
            try
            {
                string fileName = value.ToString();
                fileName = fileName.Replace("/", " ");
                fileName = fileName.Replace(":", " ");
                fileName = fileName.Trim();
                string path =Path.GetFullPath(ImageManager.ImageDirectory+fileName);

                if (File.Exists(path))
                {
                    return new BitmapImage(new Uri(path));
                }
                else
                {
                    ImageManager.GetImageFromService(fileName);
                    return new BitmapImage(new Uri(path));
                }
            }
            catch
            {
                return null;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
