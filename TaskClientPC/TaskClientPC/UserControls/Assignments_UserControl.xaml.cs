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
using TaskClientPC.Covertors;
using TaskClientPC.scripts;
using TaskClientPC.TaskyServiceReference;
using TaskClientPC.UpdateWindows;

namespace TaskClientPC.UserControls
{
    /// <summary>
    /// Interaction logic for Assignments_UserControl.xaml
    /// </summary>
    public partial class Assignments_UserControl : UserControl
    {
        private UserServiceClient userServiceClient;
        private Assignment assignment;
        private AssignmentList assignments;
        private WpfHelper wpfHelper;
        private IEnumerable<object> _originalItems;

        public Assignments_UserControl()
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            wpfHelper = new WpfHelper();
            assignments = wpfHelper.DeleteAssignmentsThatNull();
            AssignmentsListView.ItemsSource = assignments;

            FilterCategoryComboBox.ItemsSource = userServiceClient.GetCategories();
            FilterForUserComboBox.ItemsSource = userServiceClient.GetUsers();
            FilterForShiftComboBox.ItemsSource = userServiceClient.GetShifts();

            assignment = new Assignment();
        }
        private void AssignmentsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (AssignmentsListView.SelectedIndex == -1) return;
            DataBorder.Visibility = Visibility.Visible;
            UpdateButton.Visibility = Visibility.Visible;
            DeleteButton.Visibility = Visibility.Visible;
            assignment = AssignmentsListView.SelectedItem as Assignment;
            DataGrid.DataContext = assignment;
            if (assignment == null)
            {
                DataBorder.Visibility = Visibility.Collapsed;
            }
            else
            {
                DataBorder.Visibility = Visibility.Visible;
                if (assignment.doneByUser == null)
                {
                    DoneByUserSP.Visibility = Visibility.Collapsed;
                    SummerySP.Visibility = Visibility.Collapsed;
                    ImageSP.Visibility = Visibility.Collapsed;
                }
                else
                {
                    DoneByUserSP.Visibility = Visibility.Visible;
                    SummerySP.Visibility = Visibility.Visible;
                    ImageSP.Visibility = Visibility.Visible;

                }
                if (assignment.forShift.start < DateTime.Now)
                {
                    UpdateButton.Visibility = Visibility.Collapsed;
                    ImageSP.Visibility = Visibility.Visible;
                }
                else
                {
                    UpdateButton.Visibility = Visibility.Visible;
                    ImageSP.Visibility = Visibility.Collapsed;
                }
            }
        }
        // Add this method to handle search
        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = SearchBox.Text.ToLower();

            // Store original items if not already stored
            if (_originalItems == null)
            {
                _originalItems = AssignmentsListView.ItemsSource.Cast<object>();
            }

            // If search box is empty, restore original list
            if (string.IsNullOrWhiteSpace(searchText))
            {
                AssignmentsListView.ItemsSource = _originalItems;
                return;
            }

            // Filter items
            var filteredItems = _originalItems.Where(item =>
            {
                var subject = item.GetType().GetProperty("subject")?.GetValue(item)?.ToString().ToLower() ?? "";
                return subject.Contains(searchText);
            });

            AssignmentsListView.ItemsSource = filteredItems;
        }
        private void UpdateAssignment(object sender, RoutedEventArgs e)
        {
            UpdateAssignment updateAssignment = new UpdateAssignment(assignment);
            if ((bool)updateAssignment.ShowDialog())
            {
                assignments = userServiceClient.GetAssignments();
                AssignmentsListView.ItemsSource = assignments;
            }
        }
        private void AddAssignment(object sender, RoutedEventArgs e)
        {
            new UpdateAssignment().ShowDialog();
            assignments = userServiceClient.GetAssignments();
            AssignmentsListView.ItemsSource = assignments;
        }

        private void DeleteAssignment(object sender, RoutedEventArgs e)
        {
            if (wpfHelper.LoadConfirmWindow(Application.Current.MainWindow) == true)
            {
                userServiceClient.DeleteAssignment(assignment);
                DataGrid.DataContext = null;
                DeleteButton.Visibility = Visibility.Collapsed;
                UpdateButton.Visibility = Visibility.Collapsed;
                AssignmentsListView.ItemsSource = userServiceClient.GetUsers();
            }
        }
        private void FlipCard_Click(object sender, RoutedEventArgs e)
        {
            Button TriggerButton = sender as Button;
            AssignmentList FilteredAssignments = userServiceClient.GetAssignments();
            ConvertUser convertUser = new ConvertUser();
            ConvertShift convertShift = new ConvertShift();
            ConvertCategory convertCategory = new ConvertCategory();

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
            }
            if (TriggerButton.Content.ToString() == "Apply Filters")
            {
                if(FilterSubjectTextBox.Text != string.Empty)
                {
                    FilteredAssignments.RemoveAll(a => a.subject != FilterSubjectTextBox.Text);
                }
                if(FilterCategoryComboBox.Text != string.Empty)
                {
                    FilteredAssignments.RemoveAll(a => a._category.ID != (FilterCategoryComboBox.SelectedItem as Category).ID);
                }
                if(FilterDescriptionTextBox.Text != string.Empty)
                {
                    FilteredAssignments.RemoveAll(a => a.description != FilterDescriptionTextBox.Text);
                }
                if (FilterForUserComboBox.Text != string.Empty)
                {
                    FilteredAssignments.RemoveAll(a => a.forUser.ID != (FilterForUserComboBox.SelectedItem as User).ID);
                }
                if (FilterForShiftComboBox.Text != string.Empty)
                {
                    FilteredAssignments.RemoveAll(a => a.forShift.ID != (FilterForShiftComboBox.SelectedItem as Shift).ID);
                }
                AssignmentsListView.ItemsSource = FilteredAssignments;
            }
            if(TriggerButton.Content.ToString() == "Show All Assignments")
            {
                FilterSubjectTextBox.Text = FilterCategoryComboBox.Text = FilterDescriptionTextBox.Text =
                    FilterForUserComboBox.Text = FilterForShiftComboBox.Text = string.Empty;

                AssignmentsListView.ItemsSource = userServiceClient.GetAssignments();
            }
        }

        private void ViewImage(object sender, RoutedEventArgs e)
        {
            new ImageWindow(assignment).Show();
        }
    }
}
