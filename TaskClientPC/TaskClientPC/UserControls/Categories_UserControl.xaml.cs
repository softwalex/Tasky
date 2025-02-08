using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
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
using UserControl = System.Windows.Controls.UserControl;

namespace TaskClientPC.UserControls
{
    /// <summary>
    /// Interaction logic for Categories_UserControl.xaml
    /// </summary>
    public partial class Categories_UserControl : UserControl
    {
        UserServiceClient serviceClient;
        Category category;
        CategoryList categoriesList;
        private IEnumerable<object> _originalItems;

        public Categories_UserControl()
        {
            InitializeComponent();
            serviceClient = new UserServiceClient();
            category = new Category();
            categoriesList = serviceClient.GetCategories();
            CategoriesListView.ItemsSource = categoriesList;
        }
        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = SearchBox.Text.ToLower();

            // Store original items if not already stored
            if (_originalItems == null)
            {
                _originalItems = CategoriesListView.ItemsSource.Cast<object>();
            }

            // If search box is empty, restore original list
            if (string.IsNullOrWhiteSpace(searchText))
            {
                CategoriesListView.ItemsSource = _originalItems;
                return;
            }

            // Filter items
            var filteredItems = _originalItems.Where(item =>
            {
                var name = item.GetType().GetProperty("name")?.GetValue(item)?.ToString().ToLower() ?? "";
                return name.Contains(searchText);
            });

            CategoriesListView.ItemsSource = filteredItems;
        }
        private void CategoriesListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            category = CategoriesListView.SelectedItem as Category;
            if(category == null) {  return; }
            DeleteButton.Visibility = Visibility.Visible;
            NewCategoryTextbox.Visibility = Visibility.Collapsed;
            CencelButton.Visibility = Visibility.Collapsed;
        }

        private void AddNewCategoryButton(object sender, RoutedEventArgs e)
        {
            if (CencelButton.Visibility == Visibility.Visible)
            {
                if (NewCategoryTextbox.Text != string.Empty)
                {
                    if (NewCategoryTextbox.Text.Length <= 20)
                    {
                        if (serviceClient.NewCategory(new Category { name = NewCategoryTextbox.Text }) == null)
                        {
                            ErrorText.Text = "There is already category like this";
                        }
                        else
                        {
                            NewCategoryTextbox.Visibility = Visibility.Collapsed;
                            CencelButton.Visibility = Visibility.Collapsed;
                            NewCategoryTextbox.Text = string.Empty;
                            categoriesList = serviceClient.GetCategories();
                            CategoriesListView.ItemsSource = categoriesList;
                        }
                    }
                    else
                    {
                        ErrorText.Text = "the name is longer then 20 characters";
                    }
                }
                else
                {
                    ErrorText.Text = "The field is Empty";
                }
            }
            else
            {
                NewCategoryTextbox.Visibility = Visibility.Visible;
                CencelButton.Visibility = Visibility.Visible;
                DeleteButton.Visibility = Visibility.Collapsed;
            }
        }

        private void CencelAddButton(object sender, RoutedEventArgs e)
        {
            NewCategoryTextbox.Text = ErrorText.Text = string.Empty;
            NewCategoryTextbox.Visibility = Visibility.Collapsed;
            CencelButton.Visibility = Visibility.Collapsed;
        }

        private void DeleteCategoryButton(object sender, RoutedEventArgs e)
        {
            if (category == null) { return; }

            serviceClient.DeleteCategory(category);

            DeleteButton.Visibility = Visibility.Collapsed;
            AddNewButton.Visibility = Visibility.Visible;
            NewCategoryTextbox.Text = string.Empty;

            categoriesList = serviceClient.GetCategories();
            CategoriesListView.ItemsSource = categoriesList;
        }
    }
}
