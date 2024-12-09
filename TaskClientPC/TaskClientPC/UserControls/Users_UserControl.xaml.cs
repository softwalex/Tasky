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

namespace TaskClientPC.UserControls
{
    /// <summary>
    /// Interaction logic for Users_UserControl.xaml
    /// </summary>
    public partial class Users_UserControl : UserControl
    {
        private UserServiceClient serviceClient;
        private UserList users;
        public Users_UserControl()
        {
            InitializeComponent();
            serviceClient = new UserServiceClient();
            users=serviceClient.GetUsers();
            usersListView.ItemsSource = users;
        }

        private void usersListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            User user = usersListView.SelectedItem as User;
            DataGrid.DataContext = user;
        }
    }
}
