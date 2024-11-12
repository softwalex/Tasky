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
using TaskClientPC.Valideaions;

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
        }
        private void tbPass1_PasswordChanged(object sender, RoutedEventArgs e)//Check Password Field.
        {
            ValidPassword validPassword = new ValidPassword();
            ValidationResult result = validPassword.Validate(tbPass1.Password, null); //is the password field valid?
                                                                                    
            if (!result.IsValid)
            {
                //Eror - password is not valid
                tbPass1.ToolTip = result.ErrorContent.ToString();
                tbPass1.BorderBrush = new SolidColorBrush(Colors.Red);
                tbPass1.BorderThickness = new Thickness(1);
                lblErroPass1.Content = result.ErrorContent.ToString();
                PassIsOk = true;
            }
            else
            {
                //password is valid
                tbPass1.ToolTip = null;
                tbPass1.BorderBrush = new SolidColorBrush(Colors.Black);
                tbPass1.BorderThickness = new Thickness(1);
                lblErroPass1.Content = string.Empty;
                PassIsOk = false;
            }
            tbPass2_PasswordChanged(sender, e);
        }

        private void tbPass2_PasswordChanged(object sender, RoutedEventArgs e)//Check Repeat Password Field.
        {
            //Is this password is the same as in the passwordbox
            if (!tbPass1.Password.Equals(tbPass2.Password))
            {
                //Eror - password is not valid
                tbPass2.ToolTip = "Passwords do not match!";
                tbPass2.BorderBrush = new SolidColorBrush(Colors.Red);
                tbPass2.BorderThickness = new Thickness(1);
                lblErroPass2.Content = "Passwords do not match!";
                RePassIsOk = true;
            }
            else
            {
                //password is valid
                tbPass2.ToolTip = null;
                tbPass2.BorderBrush = new SolidColorBrush(Colors.Black);
                tbPass2.BorderThickness = new Thickness(1);
                lblErroPass2.Content = string.Empty;
                RePassIsOk = false;
            }
        }
        private void Link_To_LogInWindow(object sender, RoutedEventArgs e)
        {
            LogInWindow logInWindow = new LogInWindow();
            logInWindow.Show();
            this.Close();
        }

        //TODO - SignUp function (using TaskyService)
    }
}
