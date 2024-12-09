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

namespace TaskClientPC.UserControls
{
    /// <summary>
    /// Interaction logic for MainUserControl.xaml
    /// </summary>
    public partial class MainUserControl : Window
    {
        public MainUserControl()
        {
            InitializeComponent();
        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {
            if((bool)(sender as RadioButton).IsChecked)
            {
                if ((sender as RadioButton).Content == null) return;
                string text=(sender as RadioButton).Content.ToString();
                MainGrid.Children.Clear();
                switch (text)
                {
                    case "Users":
                        MainGrid.Children.Add(new Users_UserControl());
                        break;
                }
            }
        }
    }
}
