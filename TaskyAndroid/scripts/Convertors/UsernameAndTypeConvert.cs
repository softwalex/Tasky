using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UserServer;

namespace TaskyAndroid.Convertors
{
    class UsernameAndTypeConvert : IValueConverter
    {
        public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
        {
            if (value is null) return "X";

            try
            {
                if (value is User user)
                {
                    return $"{user.firstname} {user.lastname} ({Enum.GetName(typeof(UserType), user.userType)})";
                }
                return null;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }

        public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
