using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TaskClientPC.TaskyServiceReference;

namespace TaskClientPC.UpdateWindows
{
    /// <summary>
    /// Interaction logic for UpdateShift.xaml
    /// </summary>
    public partial class UpdateShift : Window
    {
        UserServiceClient userServiceClient;
        Shift shift;
        public UpdateShift()
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            shift = new Shift();
        }
        private void StartTime_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (StartTime.SelectedDate.HasValue)
            {
                StartTimePicker.Visibility = Visibility.Visible;
                StartTimePicker.Focus();
            }
            else
            {
                StartTimePicker.Visibility = Visibility.Collapsed;
            }
        }

        private void EndTime_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (EndTime.SelectedDate.HasValue)
            {
                EndTimePicker.Visibility = Visibility.Visible;
                EndTimePicker.Focus();
            }
            else
            {
                EndTimePicker.Visibility = Visibility.Collapsed;
            }
        }
        private bool IsValidDate(DateTime StartDate, DateTime EndDate)
        {
            if (StartDate == null || EndDate == null)
            {
                ErorText.Text = "Date Fields cannot be empty";
                return false;
            }
            if(StartDate > EndDate )
            {
                ErorText.Text = "Start-Date must be before the End-Date";
                return false;
            }
            return true;
        }
        private void AddShiftButton(object sender, RoutedEventArgs e)
        {
            DateTime StartOfShift = DateTime.Parse(StartTime.Text+" "+StartTimePicker.Text);
            DateTime EndOfShift = DateTime.Parse(EndTime.Text+" "+ EndTimePicker.Text);
            if (ShiftNameBox.Text == string.Empty)
            {
                ErorText.Text = "The shift must have a name";
                return;
            }
            shift.shiftName = ShiftNameBox.Text;
            if (!IsValidDate(StartOfShift, EndOfShift))
                return;
            shift.start = StartOfShift;
            shift.end = EndOfShift;

            ConfirmWindow confirmWindow = new ConfirmWindow();
            confirmWindow.Owner = this;
            bool? Result = confirmWindow.ShowDialog();

            if (Result == true)
            {
                userServiceClient.NewShift(shift);
                this.Close();
            }
        }
        private void UpdateShiftButton(object sender, RoutedEventArgs e)
        {

        }
        private void CloseUpdateWindow(object sender, RoutedEventArgs e)=>this.Close();
    }
}
