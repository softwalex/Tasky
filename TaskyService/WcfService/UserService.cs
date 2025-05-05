using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.ServiceModel;
using ViewModel;
using System.Security.Principal;
using System.Net.Mail;
using System.ServiceModel.MsmqIntegration;
using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using SendGrid.Helpers.Mail;
using SendGrid;

namespace WcfService
{
    public class UserService : IUserService
    {
        private UserDB userDB = new UserDB();

        #region User
        public User UserLogin(string email, string password)
        {
            User user = userDB.Login(email, password);
            return user;
        }
        public UserList GetUsersbyType(UserType type)
        {
            UserList users = userDB.SelectByUserType(type);
            return users;
        }
        public UserList GetUsers()
        {
            UserList users = userDB.SelectAll();
            return users;
        }

        public bool IsEmailFree(string email)
        {
            User user = userDB.SelectByEmail(email);
            return (user == null);
        }
        public User GetUserByEmail(string email)
        {
            User user = userDB.SelectByEmail(email);
            return user;
        }
        public User NewUser(User user)
        {
            if (userDB.SelectByEmail(user.email) != null)
            {
                return null;
            }
            userDB.Insert(user);
            return user;
        }

        public bool UpdateUser(User user)
        {
            if (userDB.SelectByEmail(user.email) != null)
            {
                userDB.Update(user);
                return true;
            }
            return false;
        }
        public bool DeleteUser(User user)
        {
            if (userDB.SelectByEmail(user.email) != null)
            {
                userDB.Delete(user.ID);
                return true;
            }
            return false;
        }
        #endregion

        #region Shift
        public ShiftList GetShifts()
        {
            ShiftDB shiftDB = new ShiftDB();
            ShiftList shifts = shiftDB.SelectAll();
            return shifts;
        }

        public ShiftList GetPastShifts(DateTime date)
        {
            ShiftDB shiftDB = new ShiftDB();
            ShiftList shifts = shiftDB.SelectByDate(date,true);
            return shifts;
        }
        public ShiftList GetFutureShifts(DateTime date)
        {
            ShiftDB shiftDB = new ShiftDB();
            ShiftList shifts = shiftDB.SelectByDate(date,false);
            return shifts;
        }
        public Shift GetShift(string name)
        {
            ShiftDB shiftDB = new ShiftDB();
            Shift shifts = shiftDB.SelectByShiftName(name);
            return shifts;
        }

        public Shift NewShift(Shift shift)
        {
            ShiftDB ShiftDB = new ShiftDB();
            ShiftDB.Insert(shift);
            return shift;
        }

        public void UpdateShift(Shift shift)
        {
            ShiftDB shiftDB=new ShiftDB();
            shiftDB.Update(shift);
        }

        public bool DeleteShift(Shift shift)
        {
            ShiftDB shiftDB = new ShiftDB();
            if (shiftDB.SelectByShiftName(shift.shiftName) != null)
            {
                shiftDB.Delete(shift.ID);
                return true;
            }
            return false;
        }
        #endregion

        #region Assignment
        public AssignmentList GetAssignments()
        {
            AssignmentDB assignmentDB = new AssignmentDB();
            AssignmentList assignments = assignmentDB.SelectAll();
            return assignments;
        }
        public Assignment GetAssignmentById(int id)
        {
            AssignmentDB assignmentDB=new AssignmentDB();
            Assignment assignment = assignmentDB.SelectById(id);
            return assignment;
        }
        public Assignment GetAssignmentsBySubject(string Subject)
        {
            AssignmentDB assignmentDB = new AssignmentDB();
            Assignment assignment = assignmentDB.SelectBySuject(Subject);
            return assignment;
        }

        public AssignmentList GetAssignmentsByCategory(string Category)
        {
            AssignmentDB assignments = new AssignmentDB();
            AssignmentList list = assignments.SelectByCategory(Category);
            return list;
        }

        public AssignmentList GetAssignmentByShift(Shift shift)
        {
            AssignmentDB assignmentDB=new AssignmentDB();
            AssignmentList list = assignmentDB.SelectByShift(shift.ID);
            return list;
        }

        public Assignment NewAssignment(Assignment assignment)
        {
            AssignmentDB assignmentDB=new AssignmentDB();
            assignmentDB.Insert(assignment);
            return assignment;
            
        }

        public bool UpdateAssignment(Assignment assignment)
        {
            AssignmentDB assignmentDB = new AssignmentDB();
            var assignmentInList = assignmentDB.SelectAll().FirstOrDefault(u => u.ID == assignment.ID);

            if (assignmentInList != null)
            {
                assignmentDB.Update(assignment);
                return true;
            }
            return false;
        }

        public bool DeleteAssignment(Assignment assignment)
        {
            AssignmentDB assignmentDB = new AssignmentDB();
            if (assignmentDB.SelectBySuject(assignment.subject) != null)
            {
                assignmentDB.Delete(assignment.ID);
                return true;
            }
            return false;
        }
        #endregion

        #region UserInShift
        public UserInShiftList GetAllUsersInShift()
        {
            UserInShiftDB usersInShift = new UserInShiftDB();
            UserInShiftList list = usersInShift.SelectAll();
            return list;
        }
        public UserInShiftList GetUsersInShift(Shift shift)
        {
            UserInShiftDB usersInShift = new UserInShiftDB();
            UserInShiftList list = usersInShift.SelectByShift(shift);
            return list;
        }
        public UserInShift GetByUser(User user)
        {
            UserInShiftDB userInShiftDB = new UserInShiftDB();
            UserInShift userInShift = userInShiftDB.SelectByUser(user);
            return userInShift;
        }

        public UserInShift NewUserInShift(UserInShift user)
        {
            UserInShiftDB userInShiftDB = new UserInShiftDB();
            userInShiftDB.Insert(user);
            return user;
        }   

        public bool UpdateUserInShift(UserInShift user)
        {
            UserInShiftDB userInShiftDB = new UserInShiftDB();
            if (userInShiftDB.SelectById(user.ID) != null)
            {
                userInShiftDB.Update(user);
                return true;
            }
            return false;
        }

        public bool DeleteUserInShift(UserInShift user)
        {
            UserInShiftDB userInShiftDB = new UserInShiftDB();
            var userInList = userInShiftDB.SelectAll().FirstOrDefault(u => u.ID == user.ID);

            if (userInList != null)
            {
                userInShiftDB.Delete(user.ID);
                return true;
            }
            return false;
        }
        #endregion

        #region Category
        public CategoryList GetCategories()
        {
            CategoryDB categoryDB = new CategoryDB();
            CategoryList categoryList = categoryDB.SelectAll();
            return categoryList;

        }

        public Category GetByName(string name)
        {
            CategoryDB categoryDB = new CategoryDB();
            Category category = categoryDB.SelectByName(name);
            return category;
        }

        public Category NewCategory(Category category)
        {
            CategoryDB categoryDB = new CategoryDB();
            if (categoryDB.SelectByName(category.name) == null)
            {
                categoryDB.Insert(category);
                return category;
            }
            return null;
        }

        public bool UpdateCategory(Category category)
        {
            CategoryDB categoryDB = new CategoryDB();
            if (categoryDB.SelectByName(category.name) != null)
            {
                categoryDB.Update(category);
                return true;
            }
            return false;
        }

        public bool DeleteCategory(Category category)
        {
            CategoryDB categoryDB = new CategoryDB();
            if (categoryDB.SelectByName(category.name) != null)
            {
                categoryDB.Delete(category.ID);
                return true;
            }
            return false;
        }
        #endregion

        #region Email
        private readonly string smtpServer = "smtp.sendgrid.net";
        private readonly int smtpPort = 587;
        private readonly string smtpUser = "apikey";
        private readonly string smtpPass = Environment.GetEnvironmentVariable("Tasky_Sendgrid_API_Key");
        private readonly string templateId = "d-ab4e9080da6241838e3d87195e4acfc5";

        public async void SendEmailAsync(string fromEmail, string toEmail, string subject, string body)
        {
            var email = new MimeMessage();
            email.From.Add(MailboxAddress.Parse(fromEmail));
            email.To.Add(MailboxAddress.Parse(toEmail));
            email.Subject = subject;
            email.Body = new TextPart(MimeKit.Text.TextFormat.Plain)
            {
                Text = body
            };

            using (var smtp = new MailKit.Net.Smtp.SmtpClient())
            {
                try
                {
                    await smtp.ConnectAsync(smtpServer, smtpPort, SecureSocketOptions.StartTls);
                    await smtp.AuthenticateAsync(smtpUser, smtpPass);
                    await smtp.SendAsync(email);
                }
                finally
                {
                    await smtp.DisconnectAsync(true);
                }
            }
        }

        public void SendEmailUsingTemplateAsync(string toEmail, string Text)
        {
            var client = new SendGridClient(smtpPass);
            var from = new EmailAddress("taskynoreply@gmail.com", "Tasky");
            var to = new EmailAddress(toEmail);

            var msg = MailHelper.CreateSingleTemplateEmail(from, to, templateId, new
            {
                Text = Text
            });

            try
            {
                var response = client.SendEmailAsync(msg).Result;
                Console.WriteLine($"Email sent! Status Code: {response.StatusCode}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error sending email: {ex.Message}");
            }
        }
        #endregion
    }
}
