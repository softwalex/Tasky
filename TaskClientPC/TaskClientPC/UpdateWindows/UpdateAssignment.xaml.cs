using ControlzEx.Standard;
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
using TaskClientPC.Covertors;
using TaskClientPC.TaskyServiceReference;

namespace TaskClientPC.UpdateWindows
{
    /// <summary>
    /// Interaction logic for UpdateAssignment.xaml
    /// </summary>
    public partial class UpdateAssignment : Window
    {
        UserServiceClient userServiceClient;
        Assignment assignment;
        UserList users;
        ShiftList shifts;
        CategoryList categories;
        public UpdateAssignment(Assignment assignment)
        {
            InitializeComponent();
            CreateProparties();
            this.DataContext = assignment;
            this.assignment = assignment;
            CategoryComboBox.SelectedItem = assignment._category;
            UserComboBox.SelectedItem = assignment.forUser;
            ShiftComboBox.SelectedItem = assignment.forShift;

        }
        public UpdateAssignment()
        {
            InitializeComponent();
            CreateProparties();
            assignment = new Assignment();
            SubmitButton.Content = "Add Assignment";
            SubmitButton.Click -= UpdateAssignmentButton;
            SubmitButton.Click += AddAssignmentButton;
        }
        public void CreateProparties()
        { 
            userServiceClient = new UserServiceClient();
            users = userServiceClient.GetUsers();
            shifts = userServiceClient.GetFutureShifts(DateTime.Now);
            categories = userServiceClient.GetCategories();

            CategoryComboBox.ItemsSource = categories;
            UserComboBox.ItemsSource = users;
            ShiftComboBox.ItemsSource = shifts;
        }

        public bool IsValid()
        {
            if (SubjectBox.Text.ToString() == string.Empty || DescriptionBox.Text.ToString() == string.Empty)
            {
                ErrorText.Text = "Assignment must have a subject and description";
                return false;
            }
            else if (CategoryComboBox.SelectedItem == null || UserComboBox.SelectedItem == null || ShiftComboBox.SelectedItem == null)
            {
                ErrorText.Text = "You must fill in all comboboxes";
                return false;
            }
            return true;
        }
        private void UpdateAssignmentButton(object sender, RoutedEventArgs e)
        {
            if(IsValid())
            {
                assignment.subject = SubjectBox.Text;
                assignment.description = DescriptionBox.Text;
                assignment.dateOfAssigment = DateTime.Now;
                assignment._category = CategoryComboBox.SelectedItem as Category;
                assignment.forUser = UserComboBox.SelectedItem as User;
                assignment.forShift = ShiftComboBox.SelectedItem as Shift;
            }
            else { return; }

            ConfirmWindow confirmWindow = new ConfirmWindow();
            confirmWindow.Owner = this;
            bool? Result = confirmWindow.ShowDialog();

            if (Result == true)
            {
                userServiceClient.UpdateAssignment(assignment);
                this.Close();
            }
        }

        private void AddAssignmentButton(object sender, RoutedEventArgs e)
        {
            ConvertCategory convertCategory = new ConvertCategory();
            ConvertUser convertUser = new ConvertUser();
            ConvertShift convertShift = new ConvertShift();

            if(IsValid())
            {
                assignment.subject = SubjectBox.Text;
                assignment.description = DescriptionBox.Text;
                assignment.dateOfAssigment = DateTime.Now;
                assignment._category = CategoryComboBox.SelectedItem as Category;
                assignment.forUser = UserComboBox.SelectedItem as User;
                assignment.forShift = ShiftComboBox.SelectedItem as Shift;
            }
            else { return; }

            ConfirmWindow confirmWindow = new ConfirmWindow();
            confirmWindow.Owner = this;
            bool? Result = confirmWindow.ShowDialog();

            if (Result == true)
            {
                userServiceClient.NewAssignment(assignment);
                this.Close();
            }
        }

        private void CloseUpdateWindow(object sender, RoutedEventArgs e)=>this.Close();
    }
}
