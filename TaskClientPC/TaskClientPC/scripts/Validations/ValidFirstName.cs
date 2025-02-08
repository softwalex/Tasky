using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace TaskClientPC.Validations
{
    public class ValidFirstName : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string name = value.ToString().Trim();
            if (name.Length < 2) return new ValidationResult(false, "too short");
            if (name.Length > 12) return new ValidationResult(false, "too long");
            if (!Char.IsUpper(name[0])) return new ValidationResult(false, "Start big!");
            for (int i = 0; i < name.Length; i++)
            {
                if (!Char.IsLetter(name[i]))
                    return new ValidationResult(false, "only letters");
            }
            return ValidationResult.ValidResult;
        }
    }
}
