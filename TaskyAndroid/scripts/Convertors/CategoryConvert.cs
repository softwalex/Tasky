using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UserServer;

namespace TaskyAndroid.Convertors
{
    class CategoryConvert : IValueConverter
    {
        public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
        {
            if (value == null) return null;

            try
            {
                // Use pattern matching to safely cast the value to Category
                if (value is Category category)
                {
                    return $"{category.name}";
                }
                else
                {
                    return string.Empty;  // Return an empty string if the value is not of type Category
                }
            }
            catch (Exception)
            {
                return string.Empty;  // Handle unexpected errors gracefully
            }
        }


        public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
