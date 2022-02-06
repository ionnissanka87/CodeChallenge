using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Profiles;

namespace XeynergyCodeChallenge.Extentions
{
    public static class AutoMapperExtention
    {
        public static void ConfigureAutoMappingHandler(this IServiceCollection services)
        {
            services.AddAutoMapper(typeof(PersonProfile));
            services.AddAutoMapper(typeof(AdminProfile));
        }
    }
}
