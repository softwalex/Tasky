using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace TaskClientPC.Validations
{
    public class ValidEmail : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string email = value.ToString().Trim();
            Regex regex = new Regex(@"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
            bool res = regex.IsMatch(email);

            if (!res)
            {
                return new ValidationResult(res, "Email not valid");
            }
            return ValidationResult.ValidResult;
        }
    }
}
