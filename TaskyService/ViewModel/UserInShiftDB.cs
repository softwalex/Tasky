using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class UserInShiftDB : BaseDB
    {
        protected override BaseEntity NewEntity()
        {
            return new UserInShift();
        }
        protected override BaseEntity CreateModel(BaseEntity entity)
        {
            UserInShift userInShift = new UserInShift();

            UserDB user = new UserDB();
            int id_User = int.Parse(reader["_User"].ToString());
            userInShift._user = user.SelectById(id_User);

            ShiftDB shift = new ShiftDB();
            int id_Shift = int.Parse(reader["_Shift"].ToString());
            userInShift._shift = shift.SelectById(id_Shift);

            userInShift.isClockedIn = bool.Parse(reader["IsClockedIn"].ToString().ToLower());
            userInShift.userClockIn = DateTime.Parse(reader["UserClockIn"].ToString());
            userInShift.isClockedOut = bool.Parse(reader["IsClockedOut"].ToString());
            userInShift.userClockOut = DateTime.Parse(reader["UserClockOut"].ToString()); 
            
            return userInShift;
        }
        public UserInShiftList SelectAll()
        {
            command.CommandText = "SELECT * FROM UserInShiftTable";
            UserInShiftList list = new UserInShiftList(base.ExecuteCommand());
            return list;
        }
        public UserInShift SelectById(int id)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM UserInShiftTable WHERE Id=@id";
            command.Parameters.AddWithValue("@id", id);
            UserInShiftList list = new UserInShiftList(base.ExecuteCommand());
            if(list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public UserInShift SelectByUser(User user)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM UserInShiftTable WHERE User=@us";
            command.Parameters.AddWithValue("@us", user);
            UserInShiftList list = new UserInShiftList(base.ExecuteCommand());
            if (list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public UserInShiftList SelectByShift(Shift shift)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM UserInShiftTable WHERE Shift=@sh";
            command.Parameters.AddWithValue("@sh", shift);
            UserInShiftList list = new UserInShiftList(base.ExecuteCommand());
            return list;
        }
        public int Insert(UserInShift userInShift)
        {
            command.Parameters.Clear();
            command.CommandText = @"INSERT INTO UserInShiftTable (User, Shift, IsClockedIn, UserClockIn, IsClockedOut, UserClockOut) VALUES " +
                "(@User, @Shift, @IsClockedIn, @UserClockIn, @IsClockedOut, @UserClockOut);SELECT SCOPE_IDENTITY();";
           
            command.Parameters.AddWithValue("@User", userInShift._user);
            command.Parameters.AddWithValue("@Shift", userInShift._shift);
            command.Parameters.AddWithValue("@IsClockedIn", userInShift.isClockedIn);
            command.Parameters.AddWithValue("@UserClockIn", userInShift.userClockIn);
            command.Parameters.AddWithValue("@IsClockedOut", userInShift.isClockedOut);
            command.Parameters.AddWithValue("@UserClockOut", userInShift.userClockOut);

            return Convert.ToInt32(command.ExecuteScalar());
        }
        public int Update(UserInShift userInShift)
        {
            command.Parameters.Clear();
            command.CommandText = @"UPDATE INTO UserInShiftTable SET " +
                "User = @User, Shift = @Shift, IsClockedIn = @IsClockedIn, UserClockIn = @UserClockIn, IsClockedOut = @IsClockedOut, UserClockOut = @UserClockOut " +
                "WHERE Id = @Id";

            command.Parameters.AddWithValue("@User", userInShift._user);
            command.Parameters.AddWithValue("@Shift", userInShift._shift);
            command.Parameters.AddWithValue("@IsClockedIn", userInShift.isClockedIn);
            command.Parameters.AddWithValue("@UserClockIn", userInShift.userClockIn);
            command.Parameters.AddWithValue("@IsClockedOut", userInShift.isClockedOut);
            command.Parameters.AddWithValue("@UserClockOut", userInShift.userClockOut);
            command.Parameters.AddWithValue("@Id", userInShift.ID);

            return Convert.ToInt32(base.ExecuteScalar());
        }
        public int Delete(int id)
        {
            command.Parameters.Clear();
            command.CommandText = "DELETE FROM UserInShiftTable WHERE Id = @Id";
            command.Parameters.AddWithValue("@Id", id);
            return base.ExecuteNonQuery();
        }
    }
}
