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
using TaskClientPC.UserControls;

namespace TaskClientPC
{
    /// <summary>
    /// Interaction logic for ResetPassword.xaml
    /// </summary>
    public partial class ResetPassword : Window
    {
        private User Currentuser;
        private UserServiceClient userServiceClient;
        private int ResetCode;
        public ResetPassword(User user)
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            Currentuser = user;
            ResetCode = SendResetCodeToEmail(Currentuser);
            ErrorText.Text = string.Empty;
        }

        private void LinkToLoginWindow(object sender, RoutedEventArgs e)
        {
            LogInWindow logInWindow = new LogInWindow();
            logInWindow.Show();
            this.Close();
        }

        private void ResetPasswordButtonClick(object sender, RoutedEventArgs e)
        {
            if(!(CodeTextBox.Text == string.Empty || PassBox.Password.ToString() == string.Empty || RePassBox.Password.ToString() == string.Empty))
            {
                if(ResetCode.ToString() == CodeTextBox.Text)
                {
                    if(PassBox.Password.ToString() == RePassBox.Password.ToString())
                    {
                        if (IsValidPassword(PassBox.Password.ToString()))
                        {
                            Currentuser.password = RePassBox.Password.ToString();
                            userServiceClient.UpdateUser(Currentuser);
                            MainUserControl mainUserControl = new MainUserControl(Currentuser);
                            mainUserControl.MainGrid.Children.Add(new DashBoard_UserControl());
                            mainUserControl.Show();
                            this.Close();
                        }
                        else
                        {
                            ErrorText.Text = "Please follow our password rules";
                        }
                    }
                    else
                    {
                        ErrorText.Text = "Password fields don't match";
                    }
                }
                else
                {
                    ErrorText.Text = "Incorrect reset code";
                }
            }
            else
            {
                ErrorText.Text = "You have to fill all of the given fields";
            }
        }

        public int SendResetCodeToEmail(User user)
        {
            Random random = new Random();
            int Code = random.Next(100000, 1000000);
            string Text = $"Hey {user.firstname}, Your Code for your password reset would be: {Code}";
            userServiceClient.SendEmailUsingTemplateAsync(user.email, Text);
            return Code;
        }

        public bool IsValidPassword(string password)
        {
            string pass = password.ToString().Trim();
            if (pass.Length < 5)
            {
                return false;
            }
            if (pass.Length > 15)
            {
                return false;
            }
            bool hascap = false;
            bool hasnumber = false;
            bool hassymbols = false;
            for (int i = 0; i < pass.Length; i++)
            {
                if (Char.IsUpper(pass[i]))
                {
                    hascap = true;
                }
                if (Char.IsDigit(pass[i]))
                {
                    hasnumber = true;
                }
                if (Char.IsPunctuation(pass[i]))
                {
                    hassymbols = true;
                }
            }
            if (!hascap)
            {
                return false;
            }
            if (!hasnumber)
            {
                return false;
            }
            if (!hassymbols)
            {
                return false;
            }
            return true;
        }
    }
}
