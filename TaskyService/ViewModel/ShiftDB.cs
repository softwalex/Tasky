using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace ViewModel
{
    public class ShiftDB : BaseDB
    {
        protected override BaseEntity NewEntity()
        {
            return new Shift();
        }
        protected override BaseEntity CreateModel(BaseEntity entity)
        {
            Shift shift = entity as Shift;
            shift.ID = int.Parse(reader["id"].ToString());
            shift.shiftName = reader["ShiftName"].ToString();
            shift.strat = DateTime.Parse(reader["Start"].ToString());
            shift.end = DateTime.Parse(reader["End"].ToString());

            return shift;
        }
        public ShiftList SelectAll()
        {
            command.CommandText = "SELECT * FROM ShiftTable";
            ShiftList list = new ShiftList(base.ExecuteCommand());
            return list;
        }
        public Shift SelectById(int id)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM ShiftTable WHERE Id=@id";
            command.Parameters.AddWithValue("@id", id);
            ShiftList list = new ShiftList(base.ExecuteCommand());
            if (list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public Shift SelectByShiftName(string name)
        {
            command.Parameters.Clear();
            command.CommandText = "SELECT * FROM ShiftTable WHERE ShiftName=@name";
            command.Parameters.AddWithValue("@name", name);
            ShiftList list = new ShiftList(base.ExecuteCommand());
            if (list.Count > 0)
            {
                return list[0];
            }
            return null;
        }
        public int Insert(Shift shift)
        {
            command.Parameters.Clear();
            command.CommandText = @"INSERT INTO ShiftTable (ShiftName, StartTime, EndTime) VALUES " +
                "(@ShiftName, @StartTime, @EndTime);SELECT SCOPE_IDENTITY();";
            command.Parameters.AddWithValue("@ShiftName", shift.shiftName);
            command.Parameters.AddWithValue("@StartTime", shift.strat);
            command.Parameters.AddWithValue("@EndTime", shift.end);

            return Convert.ToInt32(base.ExecuteScalar());
        }
        public int Update(Shift shift)
        {
            command.Parameters.Clear();
            command.CommandText = @"UPDATE ShiftTable SET " +
                "ShiftName = @ShiftName, StartTime = @StartTime, EndTime = @EndTime "+
                "WHERE Id = @Id";

            command.Parameters.AddWithValue("@ShiftName", shift.shiftName);
            command.Parameters.AddWithValue("@StartTime", shift.strat);
            command.Parameters.AddWithValue("@EndTime", shift.end);
            command.Parameters.AddWithValue("@Id", shift.ID);

            return Convert.ToInt32(base.ExecuteScalar());
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
