using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Enums;
using XeynergyCodeChallenge.Models;
using XeynergyCodeChallenge.Models.DTOs;

namespace XeynergyCodeChallenge.Profiles
{
    public class AdminProfile : Profile
    {
        public AdminProfile()
        {            
            CreateMap<Admin, AdminDTO>().ForMember(x => x.Privilege, opt => opt.MapFrom(src => src.Privilege.ToString()));
            CreateMap<AdminDTO, Admin>();
        }
        
    }
}
