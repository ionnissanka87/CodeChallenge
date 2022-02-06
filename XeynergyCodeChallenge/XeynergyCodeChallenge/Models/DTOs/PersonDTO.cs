using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace XeynergyCodeChallenge.Models.DTOs
{
    public class PersonDTO
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "First Name required.")] 
        public string FirstName { get; set; }
        [Required(ErrorMessage = "First Name required.")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "Email Address required.")] 
        public string EmailAddress { get; set; }
        public string FullName { get; set; }
    }
}
