using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.ServiceModel;
using ViewModel;

namespace WcfService
{
    public class UserService : IUserService
    {
        public User UserLogin(string email, string password)
        {
            UserDB userDB = new UserDB();
            User user = userDB.Login(email, password);
            return user;
        }
        public UserList GetUsersbyType(string type)
        {
            UserDB userDB = new UserDB();
            UserList users = userDB.SelectByUserType(type);
            return users;
        }

        public bool IsEmailFree(string email)
        {
            UserDB userDB = new UserDB();
            User user = userDB.SelectByEmail(email);
            return (user == null);
        }

        public User NewUser(User user)
        {
            UserDB userDB = new UserDB();
            if (userDB.SelectByEmail(user.email) != null)
            {
                return null;
            }
            userDB.Insert(user);
            return user;
        }

        public bool UpdateUser(User user)
        {
            UserDB userDB = new UserDB();
            if (userDB.SelectByEmail(user.email) != null)
            {
                userDB.Update(user);
                return true;
            }
            return false;
        }
        public bool DeleteUser(User user)
        {
            UserDB userDB = new UserDB();
            if (userDB.SelectByEmail(user.email) != null)
            {
                userDB.Delete(user.ID);
                return true;
            }
            return false;
        }

        //------------------------------------------------------

        public Shift GetShift(string name)
        {
            ShiftDB shiftDB = new ShiftDB();
            Shift shifts = shiftDB.SelectByShiftName(name);
            return shifts;
        }

        public Shift NewShift(Shift shift)
        {
            ShiftDB ShiftDB = new ShiftDB();
            if(ShiftDB.SelectByShiftName(shift.shiftName) == null)
            {
                ShiftDB.Insert(shift);
                return shift;
            }
            return null;
        }

        public bool UpdateShift(Shift shift)
        {
            ShiftDB shiftDB=new ShiftDB();
            if (shiftDB.SelectByShiftName(shift.shiftName) != null)
            {
                shiftDB.Update(shift);
                return true;
            }
            return false;
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

        //------------------------------------------------------

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

        public Assignment NewAssignment(Assignment assignment)
        {
            AssignmentDB assignmentDB=new AssignmentDB();
            if (assignmentDB.SelectBySuject(assignment.subject) == null)
            {
                assignmentDB.Insert(assignment);
                return assignment;
            }
            return assignment;
            
        }

        public bool UpdateAssignment(Assignment assignment)
        {
            AssignmentDB assignmentDB = new AssignmentDB();
            if (assignmentDB.SelectBySuject(assignment.subject) != null)
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

        //------------------------------------------------------

        public UserInShiftList GetUsersInShift()
        {
            UserInShiftDB usersInShift = new UserInShiftDB();
            UserInShiftList list = usersInShift.SelectAll();
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
            if (userInShiftDB.SelectByUser(user._user) != null)
            {
                userInShiftDB.Insert(user);
                return user;
            }
            return null;
        }   

        public bool UpdateUserInShift(UserInShift user)
        {
            UserInShiftDB userInShiftDB = new UserInShiftDB();
            if (userInShiftDB.SelectByUser(user._user) != null)
            {
                userInShiftDB.Update(user);
                return true;
            }
            return false;
        }

        public bool DeleteUserInShift(UserInShift user)
        {
            UserInShiftDB userInShiftDB = new UserInShiftDB();
            if (userInShiftDB.SelectByUser(user._user) != null)
            {
                userInShiftDB.Delete(user.ID);
                return true;
            }
            return false;
        }

        //------------------------------------------------------

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
            if (categoryDB.SelectByName(category.name) != null)
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
    }
}
