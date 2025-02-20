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
using TaskClientPC.scripts;
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
        private WpfHelper wpfHelper;
        private ShiftList shifts;
        private Shift shift;
        private IEnumerable<object> _originalItems;
        public Shifts_UserControl()
        {
            InitializeComponent();
            serviceClient = new UserServiceClient();
            wpfHelper = new WpfHelper();
            shifts = serviceClient.GetShifts();
            shiftsListView.ItemsSource = shifts;
            shift = new Shift();
        }
        private void shiftsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (shiftsListView.SelectedIndex == -1) return;
            try
            {
                DataBorder.Visibility = Visibility.Visible;
                UpdateButton.Visibility = Visibility.Visible;
                DeleteButton.Visibility = Visibility.Visible;
                shift = shiftsListView.SelectedItem as Shift;
                if(shift == null)
                {
                    UpdateButton.Visibility = Visibility.Collapsed;
                    DeleteButton.Visibility= Visibility.Collapsed;
                    return;
                }
                else
                {
                    UpdateButton.Visibility = Visibility.Visible;
                    DeleteButton.Visibility = Visibility.Visible;
                }
                if (shift.start < DateTime.Now)
                {
                    UpdateButton.Visibility = Visibility.Collapsed;
                    //if (shift.end > DateTime.Now)
                    //{
                    //    DeleteButton.Visibility = Visibility.Collapsed;
                    //}
                    //else
                    //{
                    //    DeleteButton.Visibility = Visibility.Visible;
                    //}
                }
                else
                    UpdateButton.Visibility = Visibility.Visible;
                DataGrid.DataContext = shift;
            }
            catch (NullReferenceException) 
            {
                return;
            }
        }
        // Add this method to handle search
        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = SearchBox.Text.ToLower();

            // Store original items if not already stored
            if (_originalItems == null)
            {
                _originalItems = shiftsListView.ItemsSource.Cast<object>();
            }

            // If search box is empty, restore original list
            if (string.IsNullOrWhiteSpace(searchText))
            {
                shiftsListView.ItemsSource = _originalItems;
                return;
            }

            // Filter items
            var filteredItems = _originalItems.Where(item =>
            {
                var firstname = item.GetType().GetProperty("shiftName")?.GetValue(item)?.ToString().ToLower() ?? "";
                return firstname.Contains(searchText);
            });

            shiftsListView.ItemsSource = filteredItems;
        }
        private void AddShift(object sender, RoutedEventArgs e)
        {
            new UpdateShift().ShowDialog();
            shifts = serviceClient.GetShifts();
            shiftsListView.ItemsSource = shifts;
        }
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
            if (TaskyMessageBox.Show("ATTENTION!"
                , "By removing this shift all the tasks that include this shift will be removed") == true)
            {
                if (wpfHelper.LoadConfirmWindow(Application.Current.MainWindow) == true)
                {
                    serviceClient.DeleteShift(shift);
                    DataGrid.DataContext = null;
                    DeleteButton.Visibility = Visibility.Collapsed;
                    UpdateButton.Visibility = Visibility.Collapsed;
                    shiftsListView.ItemsSource = serviceClient.GetShifts();
                }
            }
        }

        private void FlipCard_Click(object sender, RoutedEventArgs e)
        {
            Button TriggerButton = sender as Button;
            ShiftList FilteredShifts = serviceClient.GetShifts();

            if (FrontCard.Visibility == Visibility.Visible)
            {
                FrontCard.Visibility = Visibility.Collapsed;
                BackCard.Visibility = Visibility.Visible;
                FrontCard.Tag = "Flipped";
                BackCard.Tag = "Flipped";
            }
            else
            {
                FrontCard.Visibility = Visibility.Visible;
                BackCard.Visibility = Visibility.Collapsed;
                FrontCard.Tag = null;
                BackCard.Tag = null;

                if(TriggerButton.Content.ToString() == "Apply Filters")
                {
                    if(FilterStartTime.Text != string.Empty)
                    {
                        FilteredShifts.RemoveAll(s => s.start.Date != DateTime.Parse(FilterStartTime.Text).Date);
                    }
                    if(FilterEndTime.Text != string.Empty)
                    {
                        FilteredShifts.RemoveAll(s => s.end.Date != DateTime.Parse(FilterEndTime.Text).Date);
                    }
                    shiftsListView.ItemsSource = FilteredShifts;
                }
                if(TriggerButton.Content.ToString() == "Show All Shifts")
                {
                    FilterStartTime.Text = string.Empty;
                    FilterEndTime.Text = string.Empty;

                    shiftsListView.ItemsSource = serviceClient.GetShifts();
                }
            }
        }
    }
}
