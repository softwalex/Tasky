using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.ServiceModel;
using Model;

namespace WcfService
{
    [ServiceContract]
    public interface IUserService
    {
        #region User
        [OperationContract] User UserLogin(string email, string password);
        [OperationContract] User NewUser(User user);
        [OperationContract] bool UpdateUser(User user);
        [OperationContract] bool DeleteUser(User user);
        [OperationContract] bool IsEmailFree(string email);
        [OperationContract] UserList GetUsersbyType(UserType type);
        [OperationContract] UserList GetUsers();
        #endregion

        #region Shift
        [OperationContract] ShiftList GetShifts();
        [OperationContract] ShiftList GetPastShifts(DateTime date);
        [OperationContract] ShiftList GetFutureShifts(DateTime date);
        [OperationContract] Shift GetShift(string name);
        [OperationContract] Shift NewShift(Shift shift);
        [OperationContract] void UpdateShift(Shift shift);
        [OperationContract] bool DeleteShift(Shift shift);
        #endregion

        #region Assingment
        [OperationContract] AssignmentList GetAssignments();
        [OperationContract] Assignment GetAssignmentById(int id);

        [OperationContract] Assignment GetAssignmentsBySubject(string Subject);
        [OperationContract] AssignmentList GetAssignmentsByCategory(string Category);
        [OperationContract] AssignmentList GetAssignmentByShift(Shift shift);
        [OperationContract] Assignment NewAssignment(Assignment assignment);
        [OperationContract] void UpdateAssignment(Assignment assignment);
        [OperationContract] bool DeleteAssignment(Assignment assignment);
        #endregion

        #region UserInShift
        [OperationContract] UserInShiftList GetUsersInShift();
        [OperationContract] UserInShift GetByUser(User user);
        [OperationContract] UserInShift NewUserInShift(UserInShift user);
        [OperationContract] bool UpdateUserInShift(UserInShift user);
        [OperationContract] bool DeleteUserInShift(UserInShift user);
        #endregion

        #region Category
        [OperationContract] CategoryList GetCategories();
        [OperationContract] Category GetByName(string name);
        [OperationContract] Category NewCategory(Category category);
        [OperationContract] bool UpdateCategory(Category category);
        [OperationContract] bool DeleteCategory(Category category);
        #endregion
    }
}
