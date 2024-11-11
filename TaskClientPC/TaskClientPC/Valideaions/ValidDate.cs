using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace TaskClientPC.Valideaions
{
    public class ValidDate : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {

            DateTime date = DateTime.Parse(value.ToString().Trim());
            if (date == null)
            {
                return new ValidationResult(false, "you must select a date");
            }
            if (date > DateTime.Today.AddYears(-8))
            {
                return new ValidationResult(false, "too young");
            }
            if (date < DateTime.Today.AddYears(-110))
            {
                return new ValidationResult(false, "too old");
            }
            return ValidationResult.ValidResult;

        }
    }
}
