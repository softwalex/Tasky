using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class CategoryDB : BaseDB
    {
        protected override BaseEntity NewEntity()
        {
            return new Category();
        }
        protected override BaseEntity CreateModel(BaseEntity entity)
        {
            Category category = entity as Category;
            category.ID = int.Parse(reader["id"].ToString());
            category.name = reader["name"].ToString();
            
            return category;
        }
        public CategoryList SelectAll()
        {
            command.CommandText = "SELECT * FROM CategoryTable";
            CategoryList list = new CategoryList(base.ExecuteCommand());
            return list;
        }
        public Category SelectById(int id)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM CategoryTable WHERE Id=@id";
            command.Parameters.AddWithValue("@id", id);
            CategoryList list = new CategoryList(base.ExecuteCommand());
            if (list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public Category SelectByName(string name)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM CategoryTable WHERE Name=@name";
            command.Parameters.AddWithValue("@name", name);
            CategoryList list = new CategoryList(base.ExecuteCommand());
            if (list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public int Insert(Category category)
        {
            command.Parameters.Clear();
            command.CommandText = @"INSERT INTO CategoryTable (Name) VALUES (@Name);SELECT SCOPE_IDENTITY();";
            command.Parameters.AddWithValue("@Name",category.name);

            return Convert.ToInt32(command.ExecuteScalar());
        }
        public int Update(Category category)
        {
            command.Parameters.Clear();
            command.CommandText = "@UPDATE CategoryTable SET Name = @Name WHERE Id = @Id";
            command.Parameters.AddWithValue("@Name",category.name);

            return Convert.ToInt32(command.ExecuteScalar());
        }
        public int Delete(int id)
        {
            command.Parameters.Clear();
            command.CommandText = "DELETE FROM ShiftTable WHERE Id = @Id";
            command.Parameters.AddWithValue("@Id", id);
            return base.ExecuteNonQuery();
        }
    }
}
