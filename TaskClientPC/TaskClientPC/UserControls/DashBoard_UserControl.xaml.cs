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
using System.Windows.Threading;
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
        private DispatcherTimer dispatcherTimer;
        public DashBoard_UserControl()
        {
            InitializeComponent();
            userServiceClient = new UserServiceClient();
            shiftList = userServiceClient.GetShifts();

            dispatcherTimer = new DispatcherTimer();
            dispatcherTimer.Tick += DispatcherTimer_Tick; ;
            dispatcherTimer.Interval = new TimeSpan(0, 1, 0);
            dispatcherTimer.Start();

            shift= GetCurrentShift();
            LoadDashBoard();
        }
        private void DispatcherTimer_Tick(object sender, EventArgs e)
        {
            Shift temp = GetCurrentShift();
            if(temp!= shift)
                LoadDashBoard();
        }
        private Shift GetCurrentShift()
        {
            foreach (Shift s in shiftList)
            {
                if (s.start < DateTime.Now && s.end > DateTime.Now)
                {
                    return s;
                }
            }
            return null;
        }
        private void LoadDashBoard()
        { 
            if (shift != null)
            {
                //foreach (UserInShift u in userServiceClient.GetUsersInShift())
                //{
                //    if (u._shift != shift)
                //    {
                //        userInShiftList.Remove(u);
                //    }
                //}
                //userInShiftList.RemoveAll(u => u._shift != shift);

                assignmentList = userServiceClient.GetAssignmentByShift(shift);
                userInShiftList = userServiceClient.GetUsersInShift(shift);
                usersListView.ItemsSource = userInShiftList.OrderBy(u => u.isClockedIn);
                CurrentShift.DataContext = shift;
                InProgressBlock.Text=CompletedBlock.Text = "0";
                AssignmentsListView.ItemsSource = assignmentList;
                CompletedBlock.Text=assignmentList.FindAll(a=>a.doneByUser!=null).Count.ToString();
                InProgressBlock.Text=assignmentList.FindAll(a=>a.doneByUser==null).Count.ToString();
                //try
                //{
                //    foreach(Assignment a in AssignmentsListView.Items)
                //    {
                //        if (a.doneByUser != null)
                //        {
                //            CompletedBlock.Text = (int.Parse(CompletedBlock.Text)+1).ToString();
                //        }
                //        else
                //        {
                //            InProgressBlock.Text = (int.Parse(InProgressBlock.Text)+1).ToString();
                //        }
                //    }
                //}
                //catch (Exception)
                //{
                //    StatisticsGrid.Visibility = Visibility.Collapsed;
                //}
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

        private void ApproveButton_Click(object sender, RoutedEventArgs e)
        {
            //TODO: approve clock in by: isclockedin == true and send it to service
            //update code in MAUI project, current code: stays in the looby while the big button is collapsed

            //CODE TO TEST!!!
            Button button = sender as Button;
            UserInShift userToUpdate = userServiceClient.GetAllUsersInShift().FirstOrDefault(u => u.ID == (button.Tag as UserInShift).ID);
            userToUpdate.isClockedIn = true;
            userToUpdate.userClockIn = DateTime.Now;
            userServiceClient.UpdateUserInShift(userToUpdate);

            userInShiftList = userServiceClient.GetUsersInShift(shift);
            usersListView.ItemsSource = userInShiftList.OrderBy(u => u.isClockedIn);
        }

        private void DenyButton_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            userServiceClient.DeleteUserInShift(button.Tag as UserInShift);

            userInShiftList = userServiceClient.GetUsersInShift(shift);
            usersListView.ItemsSource = userInShiftList.OrderBy(u => u.isClockedIn);
        }
    }
}
