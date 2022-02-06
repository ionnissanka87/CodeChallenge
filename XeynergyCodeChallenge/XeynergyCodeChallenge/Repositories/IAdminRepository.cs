using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Models;

namespace XeynergyCodeChallenge.Repositories
{
    public interface IAdminRepository
    {
        Admin GetAdmin(int Id);
        IEnumerable<Admin> GetAllAdmins();
        Admin Add(Admin admin);
        Admin Update(Admin adminChanges);
        Admin Delete(int Id);
    }
}
