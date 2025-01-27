using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using TaskClientPC.TaskyServiceReference;

namespace TaskClientPC.Covertors
{
    internal class ConvertCategory : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            try
            {
                Category category = (Category)value;
                return $"{category.name}";
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string name = value.ToString();
            UserServiceClient userServiceClient = new UserServiceClient();
            CategoryList categories = userServiceClient.GetCategories();
            foreach (Category category in categories)
            {
                string temp = $"{category.name}";
                if(temp.Equals(name))
                    return category;
            }
            return null;
        }
    }
}
