using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
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
using WcfService;

namespace WpfHost
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer;
        public MainWindow()
        {
            InitializeComponent();

            ServiceHost service = new ServiceHost(typeof(UserService));
            service.Open();


            ServiceHost Imageservice = new ServiceHost(typeof(ImageService));
            Imageservice.Open();
            
            timer = new DispatcherTimer();
            timer.Interval =new TimeSpan(0,30,0);
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            UserService userService = new UserService();
            UserInShiftList userInShifts = userService.GetAllUsersInShift();
            foreach (UserInShift us in userInShifts)
            {
                if(us._shift.end < DateTime.Now)
                    if(!us.isClockedOut)
                        if(us.isClockedIn)
                {
                    us.isClockedOut = true;
                    us.userClockOut = us._shift.end;
                    userService.FullUpdateUserInShift(us);
                }
            }
            
        }
    }
}
