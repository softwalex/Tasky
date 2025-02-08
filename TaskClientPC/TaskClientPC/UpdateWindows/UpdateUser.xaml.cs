using MaterialDesignThemes.Wpf.Converters;
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
        private UserServiceClient userServiceClient;
        private User CurrentUser;
        private WpfHelper wpfHelper;
        public UpdateUser(User user)
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            wpfHelper = new WpfHelper();
            this.DataContext = user;
            UserTypeBox.ItemsSource = Enum.GetValues(typeof(UserType));
            CurrentUser = user;
            UserTypeBox.SelectedItem = user.userType;
        }
        public UpdateUser()
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            wpfHelper = new WpfHelper();
            UserTypeBox.ItemsSource = Enum.GetValues(typeof(UserType));
            SubmitButton.Content = "Add User";
            SubmitButton.Click -= UpdateUserButton;
            SubmitButton.Click += AddNewUserButton;
            CurrentUser = new User();
            this.DataContext = CurrentUser;
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
        private bool CheckFields()
        {
            if (!IsValid(FirstNameBox)) { ErorText.Text = "Invalid first name"; return false; }
            else if (!IsValid(LastNameBox)) { ErorText.Text = "Invalid last name"; return false; }
            else if (!IsValid(EmailBox)) { ErorText.Text = "Invalid email"; return false; }
            else if (!userServiceClient.IsEmailFree(EmailBox.Text) && EmailBox.Text != CurrentUser.email) { ErorText.Text = "Email is already exist"; return false; }
            else if (!IsValid(BirthdayBox)) { ErorText.Text = "Invalid birthday date"; return false; }
            else if (!IsValid(UserTypeBox)) { ErorText.Text = "Invalid type selection"; return false; }
            return true;
        }
        private void UpdateUserButton(object sender, RoutedEventArgs e)
        {
            if(CheckFields())
            {
                CurrentUser.userType = (UserType)Enum.Parse(typeof(UserType), UserTypeBox.Text);

                if (wpfHelper.LoadConfirmWindow(this) == true)
                {
                    if (userServiceClient.UpdateUser(CurrentUser))
                    {
                        this.Close();
                    }
                    else
                    {
                        ErorText.Text = "The email address is already exists in the system";
                    }
                }
            }

        }
        private void AddNewUserButton(object sender,  RoutedEventArgs e)
        {
            Random random = new Random();
            int OTP = random.Next(100000, 1000000);
            if (CheckFields())
            {
                CurrentUser.firstname = FirstNameBox.Text;
                CurrentUser.lastname = LastNameBox.Text;
                CurrentUser.email = EmailBox.Text;
                CurrentUser.birthday = DateTime.Parse(BirthdayBox.Text);
                CurrentUser.password = OTP.ToString();
                CurrentUser.userType = (UserType)Enum.Parse(typeof(UserType), UserTypeBox.Text);

                if (wpfHelper.LoadConfirmWindow(this)==true)
                {
                    userServiceClient.NewUser(CurrentUser);
                    this.Close();
                }
            }
        }
        private void CloseUpdateWindow(object sender, RoutedEventArgs e) => this.Close();
    }
}
