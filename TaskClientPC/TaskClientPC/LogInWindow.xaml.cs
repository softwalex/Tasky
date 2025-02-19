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
using TaskClientPC.scripts;
using TaskClientPC.TaskyServiceReference;
using TaskClientPC.UserControls;

namespace TaskClientPC
{
    /// <summary>
    /// Interaction logic for LogIn.xaml
    /// </summary>
    public partial class LogInWindow : Window
    {
        User user;
        UserServiceClient userServiceClient;
        TaskyMessageBox taskyMessageBox;
        public LogInWindow()
        {
            InitializeComponent();
            user = new User();
            userServiceClient = new UserServiceClient();
            taskyMessageBox = new TaskyMessageBox();
        }

        private void LogInButtonClick(object sender, RoutedEventArgs e)
        {
            if(EmailTextBox.Text == string.Empty || PassBox.Password.ToString() == string.Empty)
            {
                ErrorText.Text = "You have to fill all of the given fields";
                return;
            }
            user = userServiceClient.UserLogin(EmailTextBox.Text, PassBox.Password);
            if (user != null)
            {
                if (user.userType == UserType.Admin)
                {
                    MainUserControl mainUserControl = new MainUserControl(user);
                    mainUserControl.MainGrid.Children.Add(new DashBoard_UserControl());
                    mainUserControl.Show();
                    this.Close();
                }
                else
                {
                    ErrorText.Text = "You must be a Admin to login this software";
                }
            }
            else
            {
                ErrorText.Text = "Email or password were not found";
            }
        }
        private void LinkToSignUpWindow(object sender, RoutedEventArgs e)
        {
            SignUpWindow signUpWindow = new SignUpWindow();
            signUpWindow.Show();
            this.Close();
        }
    }
}
