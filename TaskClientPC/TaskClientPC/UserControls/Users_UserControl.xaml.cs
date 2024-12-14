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

namespace TaskClientPC.UserControls
{
    /// <summary>
    /// Interaction logic for Users_UserControl.xaml
    /// </summary>
    public partial class Users_UserControl : UserControl
    {
        private UserServiceClient serviceClient;
        private UserList users;
        private List<StackPanel> SetProps;
        private List<TextBlock> ValueBlocks;
        public Users_UserControl()
        {
            InitializeComponent();
            serviceClient = new UserServiceClient();
            users=serviceClient.GetUsers();
            usersListView.ItemsSource = users;
            SetProps = new List<StackPanel>() { SetName, SetEmail, SetBirthday, SetUsertype };
            ValueBlocks = new List<TextBlock>() { FirstNameBlock, LastNameBlock, EmailBlock, BirthdayBlock, UsertypeBlock};
        }

        private void usersListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataBorder.Visibility = Visibility.Visible;
            User user = usersListView.SelectedItem as User;
            DataGrid.DataContext = user;
        }

        private void EditProperty(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < SetProps.Count; i++)
            {
                foreach(Button b in SetProps[i].Children)
                {
                    if (b == (Button)sender)
                    {
                        PackIcon icon = b.Content as PackIcon;
                        switch (icon.Kind)
                        {
                            case PackIconKind.AccountEdit:
                                foreach(Button button in SetProps[i].Children)
                                {
                                    if((button.Content as PackIcon).Kind==PackIconKind.CheckBold || (button.Content as PackIcon).Kind == PackIconKind.Undo)
                                        button.Visibility = Visibility.Visible;
                                    else
                                        button.Visibility = Visibility.Collapsed;
                                }
                                ForEdit(SetProps[i]);
                                break;
                            case PackIconKind.CheckBold:

                                break;
                            case PackIconKind.Undo:

                                break;

                        }
                    }
                }
            }
        }
        private void ForEdit(StackPanel s)
        {
            int index; ;
            TextBox textBox;
            if (s == SetName)
            {
                TextBox textBox2;
                textBox = new TextBox() { Text = FirstNameBlock.Text.ToString(), Height = 25 };
                textBox2 = new TextBox() { Text = LastNameBlock.Text.ToString(), Height = 25 };
                index = NameSP.Children.IndexOf(FirstNameBlock);
                int index2 = NameSP.Children.IndexOf(LastNameBlock);
                NameSP.Children.Remove(FirstNameBlock);
                NameSP.Children.Remove(LastNameBlock);
                NameSP.Children.Insert(index, textBox);
                NameSP.Children.Insert(index2, textBox2);
            }
            if (s == SetEmail)
            {
                textBox = new TextBox() { Text = EmailBlock.Text.ToString(), Height = 25 };
                index = EmailSP.Children.IndexOf(EmailBlock);
                EmailSP.Children.Remove(EmailBlock);
                EmailSP.Children.Insert(index, textBox);
            }
            if (s == SetBirthday)
            {
                DatePicker datePicker = new DatePicker();
                index = BirthDaySP.Children.IndexOf(BirthdayBlock);
                BirthDaySP.Children.Remove(BirthdayBlock);
                BirthDaySP.Children.Insert(index, datePicker);
            }
            if (s == SetUsertype)
            {
                ComboBox comboBox = new ComboBox();
                comboBox.Items.Add("Admin"); comboBox.Items.Add("ShiftManager"); comboBox.Items.Add("Worker");
                index = UsertypeSP.Children.IndexOf(UsertypeBlock);
                UsertypeSP.Children.Remove(UsertypeBlock);
                UsertypeSP.Children.Insert(index, comboBox);

            }

        }
    }
}
