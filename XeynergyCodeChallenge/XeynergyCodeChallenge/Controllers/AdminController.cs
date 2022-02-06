using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Models;
using XeynergyCodeChallenge.Models.DTOs;
using XeynergyCodeChallenge.Repositories;

namespace XeynergyCodeChallenge.Controllers
{
    [Route("api/admin")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private IAdminRepository _adminRepository;
        private readonly IMapper _mapper;
        public AdminController(IAdminRepository adminRepository, IMapper mapper)
        {
            _adminRepository = adminRepository;
            _mapper = mapper;
        }

        [HttpGet]
        [Route("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(_mapper.Map<AdminDTO>(_adminRepository.GetAdmin(id)));
            //return Ok(_adminRepository.GetAdmin(id));
        }

        [HttpGet]
        [Route("all")]
        public IActionResult GetAll()
        {
            return Ok(_adminRepository.GetAllAdmins());
        }

        [HttpPost]
        public IActionResult Post(Admin admin)
        {
            return Ok(_adminRepository.Add(admin));
        }

        [HttpPut]
        public IActionResult Put(Admin admin)
        {
            return Ok(_adminRepository.Update(admin));
        }

        [HttpDelete]
        [Route("{id}")]
        public IActionResult Delete(int id)
        {
            return Ok(_adminRepository.Delete(id));
        }
    }
}
