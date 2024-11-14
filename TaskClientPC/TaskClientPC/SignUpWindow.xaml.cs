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
using TaskClientPC.Validations;

namespace TaskClientPC
{
    /// <summary>
    /// Interaction logic for SignUp.xaml
    /// </summary>
    public partial class SignUpWindow : Window
    {
        User user;
        bool PassIsOk, RePassIsOk;
        public SignUpWindow()
        {
            InitializeComponent();
            user = new User();
            this.DataContext = user;
            PassIsOk = RePassIsOk = false;
            BirthdayDatePicker.SelectedDate = DateTime.Now;
        }
        private void tbPass1_PasswordChanged(object sender, RoutedEventArgs e)//Check Password Field.
        {
            ValidPassword validPassword = new ValidPassword();
            ValidationResult result = validPassword.Validate(tbPass1.Password, null); //is the password field valid?
                                                                                    
            if (!result.IsValid)
            {
                //Error - password is not valid
                tbPass1.ToolTip = result.ErrorContent.ToString();
                tbPass1.BorderBrush = new SolidColorBrush(Colors.Red);
                tbPass1.BorderThickness = new Thickness(1);
                lblErroPass1.Content = result.ErrorContent.ToString();
                PassIsOk = false;
            }
            else
            {
                //password is valid
                tbPass1.ToolTip = null;
                tbPass1.BorderBrush = new SolidColorBrush(Colors.Black);
                tbPass1.BorderThickness = new Thickness(1);
                lblErroPass1.Content = string.Empty;
                PassIsOk = true;
            }
            tbPass2_PasswordChanged(sender, e);
        }

        private void tbPass2_PasswordChanged(object sender, RoutedEventArgs e)//Check Repeat Password Field.
        {
            //Is this password is the same as in the passwordbox
            if (!tbPass1.Password.Equals(tbPass2.Password))
            {
                //Error - password is not valid
                tbPass2.ToolTip = "Passwords do not match!";
                tbPass2.BorderBrush = new SolidColorBrush(Colors.Red);
                tbPass2.BorderThickness = new Thickness(1);
                lblErroPass2.Content = "Passwords do not match!";
                RePassIsOk = false;
            }
            else
            {
                //password is valid
                tbPass2.ToolTip = null;
                tbPass2.BorderBrush = new SolidColorBrush(Colors.Black);
                tbPass2.BorderThickness = new Thickness(1);
                lblErroPass2.Content = string.Empty;
                RePassIsOk = true;
            }
        }
        private void LinkToLogInWindow(object sender, RoutedEventArgs e)
        {
            LogInWindow logInWindow = new LogInWindow();
            logInWindow.Show();
            this.Close();
        }
        private bool DataIsValid()//check if all data fields is ok.
        {
            if (Validation.GetHasError(FirstNameTextBox)) { return false; }
            if (Validation.GetHasError(LastNameTextBox)) { return false; }
            if (Validation.GetHasError(BirthdayDatePicker)) { return false; }
            if (!PassIsOk || !RePassIsOk) { return false; }
            return true;
        }
        private void SubmitButtonClick(object sender, RoutedEventArgs e)//OP of the submit button.
        {
            UserServiceClient serviceClient = new UserServiceClient();

            //Check if the details of the user are valid
            if (!DataIsValid())
            {
                ErrorText.Text = "Error!\nCheck all the fields, make sure they are all full and valid";
                return;
            }
            if (!serviceClient.IsEmailFree(EmailTextBox.Text))
            {
                ErrorText.Text = "Error!\nEmail is already taken";
                return;
            }

            //Clean error text
            ErrorText.Text = string.Empty;

            //Insert user's details
            user.firstname = FirstNameTextBox.Text;
            user.lastname = LastNameTextBox.Text;
            user.birthday = DateTime.Parse(BirthdayDatePicker.Text);
            user.email = EmailTextBox.Text;
            user.password = tbPass1.Password.ToString();
            user.userType = UserType.Admin;//admin sign-up

            User UserToInsert = serviceClient.NewUser(user);

            //redirect to login window
            LinkToLogInWindow(sender, e);
        }
    }
}
