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
using System.Windows.Navigation;
using System.Windows.Shapes;
using TaskClientPC.TaskyServiceReference;
using TaskClientPC.UpdateWindows;

namespace TaskClientPC.UserControls
{
    /// <summary>
    /// Interaction logic for Shifts_UserControl.xaml
    /// </summary>
    public partial class Shifts_UserControl : UserControl
    {
        private UserServiceClient serviceClient;
        private ShiftList shifts;
        private Shift shift;
        public Shifts_UserControl()
        {
            InitializeComponent();
            serviceClient = new UserServiceClient();
            shifts = serviceClient.GetShifts();
            shiftsListView.ItemsSource = shifts;
            shift = new Shift();
        }
        private void shiftsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataBorder.Visibility = Visibility.Visible;
            UpdateButton.Visibility = Visibility.Visible;
            DeleteButton.Visibility = Visibility.Visible;
            shift = shiftsListView.SelectedItem as Shift;
            if(shift.end<DateTime.Now)
                UpdateButton.Visibility = Visibility.Collapsed;
            else
                UpdateButton.Visibility = Visibility.Visible;
            DataGrid.DataContext = shift;
        }
        private void AddShift(object sender, RoutedEventArgs e) => new UpdateShift().ShowDialog();
        private void UpdateShift(object sender, RoutedEventArgs e)
        {
            UpdateShift updateShift = new UpdateShift(shift);
            if ((bool)updateShift.ShowDialog())
            {
                shifts = serviceClient.GetShifts();
                shiftsListView.ItemsSource = shifts;
            }
        }
        private void DeleteShift(object sender, RoutedEventArgs e)
        {
            ConfirmWindow confirmWindow = new ConfirmWindow();
            confirmWindow.Owner = Application.Current.MainWindow;
            bool? Result = confirmWindow.ShowDialog();
            if (Result == true)
            {
                serviceClient.DeleteShift(shift);
                DataGrid.DataContext = null;
                DeleteButton.Visibility = Visibility.Collapsed;
                UpdateButton.Visibility = Visibility.Collapsed;
                shiftsListView.ItemsSource = serviceClient.GetUsers();
            }
        }
    }
}
