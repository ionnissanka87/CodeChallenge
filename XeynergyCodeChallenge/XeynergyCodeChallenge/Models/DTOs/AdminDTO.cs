using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace XeynergyCodeChallenge.Models.DTOs
{
    public class AdminDTO
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public PersonDTO Person { get; set; }
        public string Privilege { get; set; }
    }
}
