using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Enums;

namespace XeynergyCodeChallenge.Models
{
    public class Employee
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Employee name required.")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Employee email required.")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Employee department required.")]
        public Dept Department { get; set; }
    }
}
