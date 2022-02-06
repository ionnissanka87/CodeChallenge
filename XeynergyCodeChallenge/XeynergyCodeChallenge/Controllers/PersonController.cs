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
    [Route("api/person")]
    [ApiController]
    public class PersonController : ControllerBase
    {
        private IPersonsRepository _personsRepository;
        private readonly IMapper _mapper;

        public PersonController(IPersonsRepository personsRepository, IMapper mapper)
        {
            _personsRepository = personsRepository;
            _mapper = mapper;
        }

        [HttpGet]
        [Route("{id}")]
        public ActionResult Get(int id)
        {            
            return Ok(_mapper.Map<PersonDTO>(_personsRepository.GetPerson(id)));
        }

        [HttpGet]
        [Route("all")]
        public ActionResult GetAll()
        {
            return Ok(_mapper.Map<IEnumerable<PersonDTO>>(_personsRepository.GetAllPersons()));            
        }

        [HttpPost]
        public ActionResult Post(PersonDTO person)
        {
            var reqObj = _mapper.Map<Person>(person);
            return Ok(_mapper.Map<PersonDTO>(_personsRepository.Add(reqObj)));            
        }

        [HttpPut]
        public ActionResult Put(PersonDTO person)
        {
            var reqObj = _mapper.Map<Person>(person);
            return Ok(_mapper.Map<PersonDTO>(_personsRepository.Update(reqObj)));            
        }

        [HttpDelete]
        [Route("{id}")]
        public ActionResult Delete(int id)
        {
            return Ok(_mapper.Map<PersonDTO>(_personsRepository.Delete(id)));            
        }

    }
}
