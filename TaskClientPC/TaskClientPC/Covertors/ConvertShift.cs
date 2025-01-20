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
    //Convert Shift object to a string of shft's name and start date (for XAML use)
    internal class ConvertShift : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            try
            {
                Shift shift = (Shift)value;
                return $"{shift.shiftName} ({shift.start})";
            }
            catch(Exception)
            {
                return string.Empty;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string name = value.ToString();
            UserServiceClient userServiceClient = new UserServiceClient();
            ShiftList shiftList = userServiceClient.GetShifts();
            foreach (Shift shift in shiftList)
            {
                string temp = $"{shift.shiftName} ({shift.start})";
                if(temp.Equals(name))
                    return shift ;
            }
            return null;
        }
    }
}
