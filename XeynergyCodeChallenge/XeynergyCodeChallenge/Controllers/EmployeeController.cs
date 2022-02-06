using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Models;
using XeynergyCodeChallenge.Repositories;

namespace XeynergyCodeChallenge.Controllers
{
    [Route("api/employee")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {

        private IEmployeeRepository _employeeRepository;

        public EmployeeController(IEmployeeRepository employeeRepository)
        {
            _employeeRepository = employeeRepository;
        }

        [HttpGet]
        [Route("{id}")]
        public Employee Get(int id)
        {
            return _employeeRepository.GetEmployee(id);
        }

        [HttpPost]        
        public Employee Post(Employee employee)
        {
            return _employeeRepository.Add(employee);
        }
    }
}
