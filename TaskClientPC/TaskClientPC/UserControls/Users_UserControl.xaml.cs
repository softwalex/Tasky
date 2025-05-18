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
using TaskClientPC.scripts;
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
        private WpfHelper wpfHelper;
        private UserList users;
        private User user;
        private IEnumerable<object> _originalItems;
        public Users_UserControl()
        {
            InitializeComponent();
            serviceClient = new UserServiceClient();
            wpfHelper = new WpfHelper();
            users=serviceClient.GetUsers();
            usersListView.ItemsSource = users;
            user = new User();
        }

        private void usersListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (usersListView.SelectedIndex == -1) return;
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
        private void AddUser(object sender, RoutedEventArgs e)
        {
            new UpdateUser().ShowDialog();
            users = serviceClient.GetUsers();
            usersListView.ItemsSource = users;
        }
        private void UpdateUser(object sender, RoutedEventArgs e)
        {
            if (user == null) return;
            UpdateUser updateUser = new UpdateUser(user);
            updateUser.ShowDialog();
        }

        private void DeleteUser(object sender, RoutedEventArgs e)
        {
            if (TaskyMessageBox.Show("ATTENTION!"
                , "By removing this user all the tasks that include this user will be removed") == true)
            {
                if (wpfHelper.LoadConfirmWindow(Application.Current.MainWindow) == true)
                {
                    serviceClient.SendEmailUsingTemplateAsync(user.email, $"Hello {user.firstname}, the administration has removed your user from our system.");
                    serviceClient.DeleteUser(user);
                    DataGrid.DataContext = null;
                    DeleteButton.Visibility = Visibility.Collapsed;
                    UpdateButton.Visibility = Visibility.Collapsed;
                    usersListView.ItemsSource = serviceClient.GetUsers();
                }
            }
        }
        private void FlipCard_Click(object sender, RoutedEventArgs e)
        {
            Button TriggerButton = sender as Button;
            UserList FilteredUsers = serviceClient.GetUsers();

            if (FrontCard.Visibility == Visibility.Visible)
            {
                FrontCard.Visibility = Visibility.Collapsed;
                BackCard.Visibility = Visibility.Visible;
                FrontCard.Tag = "Flipped";
                BackCard.Tag = "Flipped";
            }
            else
            {
                FrontCard.Visibility = Visibility.Visible;
                BackCard.Visibility = Visibility.Collapsed;

                FrontCard.Tag = null;
                BackCard.Tag = null;

                if (TriggerButton.Content.ToString() == "Apply Filters")
                {
                    if (FilterEmailTextBox.Text != string.Empty)
                    {
                        FilteredUsers.RemoveAll(u => u.email != FilterEmailTextBox.Text);
                    }
                    if (FilterBirthDatePicker.Text != string.Empty)
                    {
                        FilteredUsers.RemoveAll(u => u.birthday != DateTime.Parse(FilterBirthDatePicker.Text));
                    }
                    if (FilterUserTypeComboBox.Text != string.Empty)
                    {
                        FilteredUsers.RemoveAll(u => u.userType != (UserType)Enum.Parse(typeof(UserType), FilterUserTypeComboBox.Text));
                    }
                    usersListView.ItemsSource = FilteredUsers;
                }
                if (TriggerButton.Content.ToString() == "Show All Users")
                {
                    FilterEmailTextBox.Text = string.Empty;
                    FilterBirthDatePicker.Text = string.Empty;
                    FilterUserTypeComboBox.Text = string.Empty;

                    usersListView.ItemsSource = serviceClient.GetUsers();
                }
            }
        }

    }
}
