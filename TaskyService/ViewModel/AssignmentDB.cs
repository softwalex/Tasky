using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class AssignmentDB : BaseDB
    {
        protected override BaseEntity NewEntity()
        {
            return new Assignment();
        }
        protected override BaseEntity CreateModel(BaseEntity entity)
        {
            Assignment assignment = entity as Assignment;

            assignment.ID = int.Parse(reader["id"].ToString());
            assignment.subject = reader["Subject"].ToString();
            assignment.description = reader["Description"].ToString();
            assignment.image = reader["Image"].ToString();
            assignment.dateOfAssigment = DateTime.Parse(reader["DateOfAssignment"].ToString());

            UserDB user = new UserDB();
            if (reader["DoneByUser"] != null)
            {
                int id_DoneByUser = int.Parse(reader["DoneByUser"].ToString());
                assignment.doneByUser = user.SelectById(id_DoneByUser);
            }
            assignment.summery = reader["Summery"].ToString();
            if (reader["ForUser"] != null)
            {
                int id_ForUser = int.Parse(reader["ForUser"].ToString());
                assignment.forUser = user.SelectById(id_ForUser);
            }
            if (reader["ForShift"] != null)
            {
                ShiftDB shift = new ShiftDB();
                int id_ForShift = int.Parse(reader["ForShift"].ToString());
                assignment.forShift = shift.SelectById(id_ForShift);
            }

            CategoryDB category = new CategoryDB();
            int id_Category = int.Parse(reader["Category"].ToString());
            assignment._category = category.SelectById(id_Category);

            return assignment;
        }
        public AssignmentList SelectAll()
        {
            command.CommandText = "SELECT * FROM AssignmentTable";
            AssignmentList list = new AssignmentList(base.ExecuteCommand());
            return list;
        }
        public Assignment SelectById(int id)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM AssignmentTable WHERE Id=@id";
            command.Parameters.AddWithValue("@id", id);
            AssignmentList list = new AssignmentList(base.ExecuteCommand());
            if (list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public Assignment SelectBySuject(string subject)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM AssignmentTable WHERE Subject=@Sub";
            command.Parameters.AddWithValue("@Sub", subject);
            AssignmentList list = new AssignmentList(base.ExecuteCommand());
            if (list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public AssignmentList SelectByCategory(string category)
        {
            command.Parameters.Clear();
            command.CommandText = $"SELECT * FROM AssignmentTable WHERE Category=@cat";
            command.Parameters.AddWithValue("@cat", category);
            AssignmentList list = new AssignmentList(base.ExecuteCommand());
            return list;
        }
        public int Insert(Assignment assignment)
        {
            command.Parameters.Clear();
            command.CommandText = @"INSERT INTO AssignmentTable (Subject, Description, Image, DateOfAssignment, DoneByUser, Summery, ForUser, ForShift, Category) " +
                "VALUES (@Subject, @Description, @Image, @DateOfAssignment, @DoneByUser, @Summery, @ForUser, @ForShift, @Category);SELECT SCOPE_IDENTITY();";
           
            command.Parameters.AddWithValue("@Subject", assignment.subject);
            command.Parameters.AddWithValue("@Description",assignment.description);
            command.Parameters.AddWithValue("@Image",assignment.image);
            command.Parameters.AddWithValue("@DateOfAssignment",assignment.dateOfAssigment);
            command.Parameters.AddWithValue("@DoneByUser",assignment.doneByUser);
            command.Parameters.AddWithValue("@Summery",assignment.summery);
            command.Parameters.AddWithValue("@ForUser",assignment.forUser);
            command.Parameters.AddWithValue("@ForShift",assignment.forShift);
            command.Parameters.AddWithValue("@Category", assignment._category);

            return Convert.ToInt32(base.ExecuteScalar());
        }
        public int Update(Assignment assignment)
        {
            command.Parameters.Clear();
            command.CommandText = @"UPDATE AssignmentTable SET " +
                "Subject = @Subject, Description = @Description, Image = @Image, DateOfAssignment = @DateOfAssignment, DoneByUser = @DoneByUser, Summery = @Summery, ForUser = @ForUser, ForShift = @ForShift, Category = @Category " +
                "WHERE Id=@Id";

            command.Parameters.AddWithValue("@Subject", assignment.subject);
            command.Parameters.AddWithValue("@Description", assignment.description);
            command.Parameters.AddWithValue("@Image", assignment.image);
            command.Parameters.AddWithValue("@DateOfAssignment", assignment.dateOfAssigment);
            command.Parameters.AddWithValue("@DoneByUser", assignment.doneByUser);
            command.Parameters.AddWithValue("@Summery", assignment.summery);
            command.Parameters.AddWithValue("@ForUser", assignment.forUser);
            command.Parameters.AddWithValue("@ForShift", assignment.forShift);
            command.Parameters.AddWithValue("@Category", assignment._category);
            command.Parameters.AddWithValue("@Id", assignment.ID);

            return Convert.ToInt32(base.ExecuteScalar());
        }
        public int Delete(int id)
        {
            command.Parameters.Clear();
            command.CommandText = "DELETE FROM AssignmentTable WHERE Id = @Id";
            command.Parameters.AddWithValue("@Id", id);
            return base.ExecuteNonQuery();
        }
    }
}
