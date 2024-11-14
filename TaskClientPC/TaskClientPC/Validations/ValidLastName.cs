using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace TaskClientPC.Validations
{
    public class ValidLastName : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string Lname = value.ToString().Trim();
            if (Lname.Length < 2) return new ValidationResult(false, "too short");
            if (Lname.Length > 16) return new ValidationResult(false, "too long");
            if (!Char.IsUpper(Lname[0])) return new ValidationResult(false, "Start big!");
            for (int i = 0; i < Lname.Length; i++)
            {
                if (!Char.IsLetter(Lname[i]))
                    return new ValidationResult(false, "only letters");
            }
            return ValidationResult.ValidResult;
        }
    }
}
