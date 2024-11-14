using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace TaskClientPC.Validations
{
    public class ValidPassword : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string pass = value.ToString().Trim();
            if (pass.Length < 5)
            {
                return new ValidationResult(false, "The password cannot be shorter than 5 characters");
            }
            if (pass.Length > 15)
            {
                return new ValidationResult(false, "The password cannot be longer than 15 characters");
            }
            bool hascap = false;
            bool hasnumber = false;
            bool hassymbols = false;
            for (int i = 0; i < pass.Length; i++)
            {
                if (Char.IsUpper(pass[i]))
                {
                    hascap = true;
                }
                if (Char.IsDigit(pass[i]))
                {
                    hasnumber = true;
                }
                if (Char.IsPunctuation(pass[i]))
                {
                    hassymbols = true;
                }
            }
            if (!hascap)
            {
                return new ValidationResult(false, "The password must have a capital letter in it");
            }
            if (!hasnumber)
            {
                return new ValidationResult(false, "The password must contain numbers");
            }
            if (!hassymbols)
            {
                return new ValidationResult(false, "The password must contain symbols");
            }
            return ValidationResult.ValidResult;
        }
    }
}
