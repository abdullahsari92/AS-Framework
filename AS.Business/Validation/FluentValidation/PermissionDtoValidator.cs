using AS.Entities.Dtos;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace AS.Core.Validation.FluentValidation
{
    internal class PermissionDtoValidator : AbstractValidator<PermissionDto>
    {

        public PermissionDtoValidator() {

           // RuleFor(t => t.ActionName).NotEmpty().Must(RuleMust.IsBase64String);

            RuleFor(t => t.Sayi).NotNull();





        }
    }


    public static class RuleMust{
         public static bool IsDegerKucukOlamaz(string deger)
            {
              
             if(deger.Length <4 )
                     return false;

             return true;

            }

        public static bool IsBase64String2(string base64)
        {
            Span<byte> buffer = new Span<byte>(new byte[base64.Length]);
            return Convert.TryFromBase64String(base64, buffer, out int bytesParsed);
        }

        public static bool IsBase64String(string value)
        {
            string base64 = value;
            if(value.Contains(','))
            {

                base64 = value.Split(',')[1];
            }

            base64 = base64.Trim();
            return (base64.Length % 4 == 0) && Regex.IsMatch(base64, @"^[a-zA-Z0-9\+/]*={0,3}$", RegexOptions.None);
        }

    }

   
}
