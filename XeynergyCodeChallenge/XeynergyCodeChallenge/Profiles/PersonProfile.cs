using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Models;
using XeynergyCodeChallenge.Models.DTOs;

namespace XeynergyCodeChallenge.Profiles
{
    public class PersonProfile : Profile
    {
        public PersonProfile()
        {
            CreateMap<Person, PersonDTO>()
                .ForMember(x => x.FullName, opt => opt.MapFrom(src => $"{src.FirstName} {src.LastName}"));
            CreateMap<PersonDTO, Person>();
        }
    }
}
