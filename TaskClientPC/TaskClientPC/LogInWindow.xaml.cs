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

namespace TaskClientPC
{
    /// <summary>
    /// Interaction logic for LogIn.xaml
    /// </summary>
    public partial class LogInWindow : Window
    {
        public LogInWindow()
        {
            InitializeComponent();
        }

        private void EventLogIn(object sender, RoutedEventArgs e)
        {
            UserServiceClient userServiceClient = new UserServiceClient();
            User user = userServiceClient.UserLogin(EmailTextBox.Text, PasswordBox.Password);
            if (user != null)
            {
                MessageBox.Show("WELCOME");
            }
            else
            {
                MessageBox.Show("EROR");
            }
        }
        private void Link_To_SignUpWindow(object sender, RoutedEventArgs e)
        {
            SignUpWindow signUpWindow = new SignUpWindow();
            signUpWindow.Show();
            this.Close();
        }

        //TODO - Login function (using TaskyService)
    }
}
