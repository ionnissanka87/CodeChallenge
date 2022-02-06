using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Enums;
using Microsoft.EntityFrameworkCore;


namespace XeynergyCodeChallenge.Models
{   
    public class Admin
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public Person Person { get; set; }
        public PrivilegeNames Privilege { get; set; }
    }
}
