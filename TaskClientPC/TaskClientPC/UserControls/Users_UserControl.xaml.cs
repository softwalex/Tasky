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
        private IEnumerable<object> _originalItems;
        public Users_UserControl()
        {
            InitializeComponent();
            serviceClient = new UserServiceClient();
            users=serviceClient.GetUsers();
            usersListView.ItemsSource = users;
            user = new User();
        }

        private void usersListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataBorder.Visibility = Visibility.Visible;
            UpdateButton.Visibility = Visibility.Visible;
            DeleteButton.Visibility = Visibility.Visible;
            user = usersListView.SelectedItem as User;
            DataGrid.DataContext = user;
        }
        // Add this method to handle search
        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = SearchBox.Text.ToLower();

            // Store original items if not already stored
            if (_originalItems == null)
            {
                _originalItems = usersListView.ItemsSource.Cast<object>();
            }

            // If search box is empty, restore original list
            if (string.IsNullOrWhiteSpace(searchText))
            {
                usersListView.ItemsSource = _originalItems;
                return;
            }

            // Filter items
            var filteredItems = _originalItems.Where(item =>
            {
                var firstname = item.GetType().GetProperty("firstname")?.GetValue(item)?.ToString().ToLower() ?? "";
                var lastname = item.GetType().GetProperty("lastname")?.GetValue(item)?.ToString().ToLower() ?? "";
                return firstname.Contains(searchText) || lastname.Contains(searchText);
            });

            usersListView.ItemsSource = filteredItems;
        }
        private void AddUser(object sender, RoutedEventArgs e) => new UpdateUser().ShowDialog();
        private void UpdateUser(object sender, RoutedEventArgs e)
        {
            UpdateUser updateUser = new UpdateUser(user);
            updateUser.ShowDialog();
        }

        private void DeleteUser(object sender, RoutedEventArgs e)
        {
            ConfirmWindow confirmWindow = new ConfirmWindow();
            confirmWindow.Owner = Application.Current.MainWindow;
            bool? Result = confirmWindow.ShowDialog();
            if (Result == true)
            {
                serviceClient.DeleteUser(user);
                DataGrid.DataContext = null;
                DeleteButton.Visibility = Visibility.Collapsed;
                UpdateButton.Visibility = Visibility.Collapsed;
                usersListView.ItemsSource = serviceClient.GetUsers();
            }
        }
    }
}
