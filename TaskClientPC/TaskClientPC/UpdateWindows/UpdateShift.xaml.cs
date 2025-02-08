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
        private UserServiceClient userServiceClient;
        private Shift shift;
        private WpfHelper wpfHelper;
        public UpdateShift()
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            wpfHelper = new WpfHelper();
            shift = new Shift();
            SubmitButton.Content = "Add Shift";
            SubmitButton.Click -= UpdateShiftButton;
            SubmitButton.Click += AddShiftButton;
        }
        public UpdateShift(Shift shift)
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            wpfHelper = new WpfHelper();
            this.DataContext = shift;
            this.shift = shift;
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
            if (StartDate < DateTime.Now)
            {
                ErorText.Text = "Start-Date must be now or in the futrue";
                return false;
            }
            if (StartDate > EndDate )
            {
                ErorText.Text = "Start-Date must be before the End-Date";
                return false;
            }
            ShiftList shifts = userServiceClient.GetShifts();
            foreach (Shift s in shifts)
            {
                if (!(s.start == shift.start && s.end == shift.end))
                {
                    if ((StartDate > s.start && StartDate < s.end) || (EndDate > s.start && EndDate < s.end))
                    {
                        ErorText.Text = "There is another shift on those dates";
                        return false;
                    }
                }
            }
            return true;
        }
        private void AddShiftButton(object sender, RoutedEventArgs e)
        {
            if(StartTime.Text==string.Empty || StartTimePicker.Text ==string.Empty || EndTime.Text==string.Empty || EndTimePicker.Text == string.Empty)
            {
                ErorText.Text = "Date Fields cannot be empty";
                return;
            }
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

            if (wpfHelper.LoadConfirmWindow(this) == true)
            {
                userServiceClient.NewShift(shift);
                this.Close();
            }
        }
        private void UpdateShiftButton(object sender, RoutedEventArgs e)
        {
            try
            {
                DateTime StartOfShift = DateTime.Parse(StartTime.Text + " " + StartTimePicker.Text);
                DateTime EndOfShift = DateTime.Parse(EndTime.Text + " " + EndTimePicker.Text);

                if (ShiftNameBox.Text == string.Empty)
                {
                    ErorText.Text = "The shift must have a name";
                    return;
                }
                if (!IsValidDate(StartOfShift, EndOfShift))
                    return;

                shift =new Shift { shiftName = ShiftNameBox.Text, start=StartOfShift, end=EndOfShift, ID=shift.ID};

                if (wpfHelper.LoadConfirmWindow(this) == true)
                {
                    userServiceClient.UpdateShift(shift);
                    this.Close();
                }
            }
            catch (FormatException)
            {
                ErorText.Text = "All the fields must be full";
                return;
            }
        }
        private void CloseUpdateWindow(object sender, RoutedEventArgs e)=>this.Close();
    }
}
