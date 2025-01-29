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
    /// Interaction logic for DashBoard_UserControl.xaml
    /// </summary>
    public partial class DashBoard_UserControl : UserControl
    {
        private UserServiceClient userServiceClient;
        private Shift shift;
        private ShiftList shiftList;
        private UserInShiftList userInShiftList;
        private UserInShift userInShift;
        private AssignmentList assignmentList;
        public DashBoard_UserControl()
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            assignmentList = userServiceClient.GetAssignments();
            shiftList = userServiceClient.GetShifts();
            userInShiftList = userServiceClient.GetUsersInShift();

            foreach(Shift s in shiftList)
            {
                if(s.start<DateTime.Now && s.end > DateTime.Now)
                {
                    shift = s;
                    break;
                }
            }
            if (shift != null)
            {
                foreach (UserInShift u in userServiceClient.GetUsersInShift())
                {
                    if (u._shift != shift)
                    {
                        userInShiftList.Remove(u);
                    }
                }

                CurrentShift.DataContext = shift;
                usersListView.ItemsSource = userInShiftList;
                AssignmentsListView.ItemsSource = userServiceClient.GetAssignmentByShift(shift);
            }
            else
            {
                CurrentShiftNameBlock.Text = "No Active Shift";
            }
        }

        private void AssignmentsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void usersListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
