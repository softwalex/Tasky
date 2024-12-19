using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Authentication;
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
using TaskClientPC.Validations;

namespace TaskClientPC.UpdateWindows
{
    /// <summary>
    /// Interaction logic for UpdateUser.xaml
    /// </summary>
    public partial class UpdateUser : Window
    {
        UserServiceClient userServiceClient;
        User CurrentUser;
        public UpdateUser(User user)
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            this.DataContext = user;
            UserTypeBox.ItemsSource = Enum.GetValues(typeof(UserType));
            CurrentUser = user;
            //FirstNameBox.Text = user.firstname;
            //LastNameBox.Text = user.lastname;
            //EmailBox.Text = user.email;
            //BirthdayBox.DisplayDate = user.birthday;
            UserTypeBox.SelectedItem = user.userType;
        }

        private bool IsValid(object field)
        {
            if (field is TextBox)
            {
                if (Validation.GetHasError(field as TextBox) || (field as TextBox).Text == string.Empty) { return false; }
            }
            if (field is DatePicker)
            {
                if (Validation.GetHasError(field as DatePicker)) { return false; };
            }
            if (field is ComboBox)
            {
                if (UserTypeBox.SelectedItem == null) { return false; }
            }
            return true;
        }
        private void UpdateUserButton(object sender, RoutedEventArgs e)
        {
            if (!IsValid(FirstNameBox)) { ErorText.Text = "Invalid first name"; }
            else if (!IsValid(LastNameBox)) { ErorText.Text = "Invalid last name"; }
            else if (!IsValid(EmailBox)) { ErorText.Text = "Invalid email"; }
            else if (!userServiceClient.IsEmailFree(EmailBox.Text) && EmailBox.Text!=CurrentUser.email) { ErorText.Text = "Email is already exist"; }
            else if (!IsValid(BirthdayBox)) { ErorText.Text = "Invalid birthday date"; }
            else if (!IsValid(UserTypeBox)) { ErorText.Text = "Invalid type selection"; }
            else
            {
                CurrentUser.userType = (UserType)Enum.Parse(typeof(UserType), UserTypeBox.Text);
                userServiceClient.UpdateUser(CurrentUser);
                
                MessageBox.Show("User updated successfully");
                this.Close();
            }

        }
        private void CloseUpdateWindow(object sender, RoutedEventArgs e) => this.Close();
    }
}
