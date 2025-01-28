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
    /// Interaction logic for Assignments_UserControl.xaml
    /// </summary>
    public partial class Assignments_UserControl : UserControl
    {
        UserServiceClient userServiceClient;
        Assignment assignment;
        AssignmentList assignments;
        public Assignments_UserControl()
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            assignments = userServiceClient.GetAssignments();
            AssignmentsListView.ItemsSource = assignments;
            assignment = new Assignment();
        }
        private void AssignmentsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataBorder.Visibility = Visibility.Visible;
            UpdateButton.Visibility = Visibility.Visible;
            DeleteButton.Visibility = Visibility.Visible;
            assignment = AssignmentsListView.SelectedItem as Assignment;
            DataGrid.DataContext = assignment;
            if (assignment.doneByUser == null)
            {
                DoneByUserSP.Visibility = Visibility.Collapsed;
                SummerySP.Visibility = Visibility.Collapsed;
            }
            else
            {
                DoneByUserSP.Visibility = Visibility.Visible;
                SummerySP.Visibility = Visibility.Visible;
            }
            if (assignment.forShift.start < DateTime.Now)
            {
                UpdateButton.Visibility = Visibility.Collapsed;
            }
            else
            {
                UpdateButton.Visibility= Visibility.Visible;
            }
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
        private void AddAssignment(object sender, RoutedEventArgs e)=>new UpdateAssignment().ShowDialog();

        private void DeleteAssignment(object sender, RoutedEventArgs e)
        {
            ConfirmWindow confirmWindow = new ConfirmWindow();
            confirmWindow.Owner = Application.Current.MainWindow;
            bool? Result = confirmWindow.ShowDialog();
            if (Result == true)
            {
                userServiceClient.DeleteAssignment(assignment);
                DataGrid.DataContext = null;
                DeleteButton.Visibility = Visibility.Collapsed;
                UpdateButton.Visibility = Visibility.Collapsed;
                AssignmentsListView.ItemsSource = userServiceClient.GetUsers();
            }
        }
    }
}
