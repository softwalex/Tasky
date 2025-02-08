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

namespace TaskClientPC.UpdateWindows
{
    /// <summary>
    /// Interaction logic for ConfirmWindow.xaml
    /// </summary>
    public partial class ConfirmWindow : Window
    {
        public bool? Result { get; private set; }
        UserServiceClient userServiceClient;
        UserList Admins;
        public ConfirmWindow()
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            Admins = userServiceClient.GetUsersbyType(UserType.Admin);
        }

        private void SubmitPassword(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < Admins.Count; i++)
            {
                if (Admins[i].password == PasswordBox.Password.ToString())
                {
                    Result = true;
                    this.DialogResult = true;
                }
            }
            ErorText.Text = "Incorrect Password";
            PasswordBox.BorderBrush = Brushes.Red;
        }

        private void CencalButton(object sender, RoutedEventArgs e)
        {
            Result = false;
            this.DialogResult = false;
        }
    }
}
