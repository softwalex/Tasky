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
    //Convert User object to a string of user's full name and email (for XAML use)
    public class ConvertUser : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if(value == null) return null;
            try
            {
                User user=null;
                if(value is User)
                    user = (User)value;
                if (value is UserInShift)
                    user = ((UserInShift)value)._user;
                if(user == null) return null;
                return $"{user.firstname} {user.lastname} ({user.email})";
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
            UserList users = userServiceClient.GetUsers();
            foreach (User user in users)
            {
                string temp = $"{user.firstname} {user.lastname} ({user.email})";
                if (temp.Equals(name))
                    return user;
            }
            return null;
        }
    }
}
