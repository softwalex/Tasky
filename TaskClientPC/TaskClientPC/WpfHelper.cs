using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TaskClientPC.TaskyServiceReference;
using TaskClientPC.UpdateWindows;

namespace TaskClientPC
{
    public class WpfHelper
    {
        UserServiceClient userServiceClient;
        public WpfHelper()
        {
            userServiceClient = new UserServiceClient();
        }
        public bool? LoadConfirmWindow(Window Owner)
        {
            ConfirmWindow confirmWindow = new ConfirmWindow();
            confirmWindow.Owner = Owner;
            bool? Result = confirmWindow.ShowDialog();
            return Result;
        }
        public AssignmentList DeleteAssignmentsThatNull()
        {
            AssignmentList assignments = userServiceClient.GetAssignments();
            foreach (Assignment a in assignments)
            {
                if ((a.forShift == null || a.forUser == null) || (a.doneByUser == null && a.summery != string.Empty))
                {
                    userServiceClient.DeleteAssignment(a);
                }
            }
            return userServiceClient.GetAssignments();
        }
    }
}
