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
            assignmentList = userServiceClient.GetAssignments();
            shiftList = userServiceClient.GetShifts();
            userInShiftList = userServiceClient.GetUsersInShift();
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
                foreach (UserInShift u in userServiceClient.GetUsersInShift())
                {
                    if (u._shift != shift)
                    {
                        userInShiftList.Remove(u);
                    }
                }

                CurrentShift.DataContext = shift;
                usersListView.ItemsSource = userInShiftList;
                InProgressBlock.Text=CompletedBlock.Text = "0";
                AssignmentsListView.ItemsSource = userServiceClient.GetAssignmentByShift(shift);
                try
                {
                    foreach(Assignment a in AssignmentsListView.Items)
                    {
                        if (a.doneByUser != null)
                        {
                            CompletedBlock.Text = (int.Parse(CompletedBlock.Text)+1).ToString();
                        }
                        else
                        {
                            InProgressBlock.Text = (int.Parse(InProgressBlock.Text)+1).ToString();
                        }
                    }
                }
                catch (Exception)
                {
                    StatisticsGrid.Visibility = Visibility.Collapsed;
                }
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
