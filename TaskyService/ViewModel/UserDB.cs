using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class UserDB : BaseDB
    {
        protected override BaseEntity NewEntity()
        {
            return new User();
        }
        protected override BaseEntity CreateModel(BaseEntity entity)
        {
            User user = entity as User;
            user.ID = int.Parse(reader["id"].ToString());
            user.firstname = reader["FirstName"].ToString();
            user.lastname = reader["LastName"].ToString();
            user.email = reader["Email"].ToString();
            user.password = reader["password"].ToString();
            user.birthday = DateTime.Parse(reader["Birthday"].ToString());
            user.userType = (UserType)Enum.Parse(typeof(UserType),reader["UserType"].ToString());

            return user;
        }
        public UserList SelectAll()
        {
            command.CommandText = "SELECT * FROM UserTable";
            UserList list = new UserList(base.ExecuteCommand());
            return list;
        }
        public User SelectById(int id)
        {
            command.CommandText = $"SELECT * FROM UserTable WHERE Id={id}";
            UserList list = new UserList(base.ExecuteCommand());
            if(list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public User SelectByEmail(string email)
        {
            command.CommandText = $"SELECT * FROM UserTable WHERE Email={email}";
            UserList list = new UserList(base.ExecuteCommand());
            if (list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public UserList SelectByUserType(string userType)
        {
            command.CommandText = $"SELECT * FROM UserTable WHERE UserType={userType}";
            UserList list = new UserList(base.ExecuteCommand());
            return list;
        }

        public User Login(string email, string password)
        {
            command.Parameters.Clear();
            command.CommandText = $"SELECT * FROM UserTable WHERE Email='{email}' AND Password='{password}'";
            UserList users = new UserList(base.ExecuteCommand());
            if (users.Count > 0)
            {
                return users[0];
            }
            return null;
        }

        public int Insert(User user)
        {
            command.Parameters.Clear();
            command.CommandText = @"INSERT INTO UserTable (FirstName, LastName, Email, Password, Birthday, UserType) VALUES " +
                "(@FirstName, @LastName, @Email, @Password, @Birthday, @UserType);SELECT SCOPE_IDENTITY();";
            command.Parameters.AddWithValue("@FirstName", user.firstname);
            command.Parameters.AddWithValue("@LastName", user.lastname);
            command.Parameters.AddWithValue("@Email", user.email);
            command.Parameters.AddWithValue("@Password", user.password);
            command.Parameters.AddWithValue("@Birthday", user.birthday);
            command.Parameters.AddWithValue("@UserType", user.userType);

            return Convert.ToInt32(base.ExecuteScalar());
        }
        public int Update(User user)
        {
            command.Parameters.Clear();
            command.CommandText = @"UPDATE UserTable SET "+
                "FirstName = @FirstName, LastName = @LastName, Email = @Email, Password = @Password, Birthday = @Birthday, UserType = @UserType "
                +"WHERE Id = @Id";

            
            command.Parameters.AddWithValue("@FirstName", user.firstname);
            command.Parameters.AddWithValue("@LastName", user.lastname);
            command.Parameters.AddWithValue("@Email", user.email);
            command.Parameters.AddWithValue("@Password", user.password);
            command.Parameters.AddWithValue("@Birthday", user.birthday);
            command.Parameters.AddWithValue("@UserType", user.userType);
            command.Parameters.AddWithValue("@Id", user.ID);

            return Convert.ToInt32(base.ExecuteScalar());
        }
        public int Delete(int id)
        {
            command.Parameters.Clear();
            command.CommandText = "DELETE FROM UserTable WHERE Id = @Id";
            command.Parameters.AddWithValue("@Id", id);
            return base.ExecuteNonQuery();
        }
    }
}
