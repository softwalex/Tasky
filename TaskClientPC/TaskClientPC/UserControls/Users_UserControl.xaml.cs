using MahApps.Metro.Controls;
using MaterialDesignThemes.Wpf;
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
using TaskClientPC.UpdateWindows;

namespace TaskClientPC.UserControls
{
    /// <summary>
    /// Interaction logic for Users_UserControl.xaml
    /// </summary>
    public partial class Users_UserControl : UserControl
    {
        private UserServiceClient serviceClient;
        private UserList users;
        private User user;
        private List<TextBlock> ValueBlocks;
        public Users_UserControl()
        {
            InitializeComponent();
            serviceClient = new UserServiceClient();
            users=serviceClient.GetUsers();
            usersListView.ItemsSource = users;
            user = new User();
            ValueBlocks = new List<TextBlock>() { FirstNameBlock, LastNameBlock, EmailBlock, BirthdayBlock, UsertypeBlock};
        }

        private void usersListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataBorder.Visibility = Visibility.Visible;
            user = usersListView.SelectedItem as User;
            DataGrid.DataContext = user;
        }
        private void OpenUpdateWindow(object sender, RoutedEventArgs e)
        {
            UpdateUser updateUser = new UpdateUser();
            updateUser.ShowDialog();
            
        }
    }
}
