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
        UserServiceClient serviceClient;
        bool PassIsOk, RePassIsOk;
        int clicks;//Number of the "Next" button clicks
        StackPanel[] stackPanels;//collection of all the fields 

        public SignUpWindow()
        {
            InitializeComponent();
            user = new User();
            serviceClient = new UserServiceClient();
            this.DataContext = user;
            PassIsOk = RePassIsOk = false;
            clicks= 0;
            stackPanels = new StackPanel[] 
                { FirstAndLastNameStackPanel, BirthdayStackPanel, EmailStackPanel, PasswordStackPanel };
        }
       
        //Hide all stackpanels except StackPanelToShow
        private void ShowOnly(StackPanel StackPanelToShow)
        {
            foreach(StackPanel s in stackPanels)
            {
                if (s != StackPanelToShow)
                {
                    s.Visibility = Visibility.Collapsed;
                }
                else
                {
                    s.Visibility = Visibility.Visible;
                }
            }
        }

        //check if field is valid to continue
        private bool IsValid(object field)
        {
            if(field is TextBox)
            {
                if (Validation.GetHasError(field as TextBox) || (field as TextBox).Text == string.Empty) { return false; }
            }
            if(field is DatePicker)
            {
                if (Validation.GetHasError(field as DatePicker)) { return false; };
            }
            if (field is PasswordBox)
            {
                if ((!PassIsOk || !RePassIsOk) || (field as PasswordBox).Password.ToString() == string.Empty) { return false; }
            }
            return true;
        }

        //Go to the next field of the sign-up if the current stackpanel fields are valid
        private void SubmitButtonClick(object sender, RoutedEventArgs e) 
        {
            clicks++;
            switch (clicks)
            {
                case 1:
                    if (IsValid(FirstNameTextBox) && IsValid(LastNameTextBox))
                    {
                        user.firstname = FirstNameTextBox.Text;
                        user.lastname = LastNameTextBox.Text;
                        ShowOnly(BirthdayStackPanel);
                        ErrorText.Text = string.Empty;
                        GoBackButton.Visibility = Visibility.Visible;
                    }
                    else
                    {
                        ErrorText.Text = "Error!\nCheck all the fields, make sure they are all full and valid";
                        clicks--;
                    }
                    break;
                case 2:
                    if (IsValid(BirthdayDatePicker))
                    {
                        user.birthday = DateTime.Parse(BirthdayDatePicker.Text);
                        ShowOnly(EmailStackPanel);
                        ErrorText.Text = string.Empty;
                    }
                    else
                    {
                        ErrorText.Text = "Error!\nCheck all the fields, make sure they are all full and valid";
                        clicks--;
                    }
                    break;
                case 3:
                    if (IsValid(EmailTextBox))
                    {
                        if (serviceClient.IsEmailFree(EmailTextBox.Text))
                        {
                            user.email = EmailTextBox.Text;
                            ShowOnly(PasswordStackPanel);
                            ErrorText.Text = string.Empty;
                        }
                        else
                        {
                            ErrorText.Text = "Error!\nEmail is already taken";
                            clicks--;
                        }
                    }
                    else
                    {
                        ErrorText.Text = "Error!\nCheck all the fields, make sure they are all full and valid";
                        clicks--;
                    }
                    break;
                case 4:
                    if (IsValid(tbPass1))
                    {
                        user.password = tbPass1.Password.ToString();
                        user.userType = UserType.Admin;
                        User u = serviceClient.NewUser(user);
                        LinkToLogInWindow(sender,e);
                    }
                    else
                    {
                        ErrorText.Text = "Error!\nCheck all the fields, make sure they are all full and valid";
                        clicks--;
                    }
                    break;

            }
        }

        //The option to go back and change previous fields
        private void GoBackButtonClick(object sender, RoutedEventArgs e)
        {
            clicks--;
            if (clicks == 0) { GoBackButton.Visibility = Visibility.Hidden; }
            switch (clicks)
            {
                case 0:
                    ShowOnly(FirstAndLastNameStackPanel);
                    break;
                case 1:
                    ShowOnly(BirthdayStackPanel);
                    break;
                case 2:
                    ShowOnly(EmailStackPanel);
                    break;
                case 3:
                    ShowOnly(PasswordStackPanel);
                    break;
            }

        }
        private void LinkToLogInWindow(object sender, RoutedEventArgs e)
        {
            LogInWindow logInWindow = new LogInWindow();
            logInWindow.Show();
            this.Close();
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
    }
}
