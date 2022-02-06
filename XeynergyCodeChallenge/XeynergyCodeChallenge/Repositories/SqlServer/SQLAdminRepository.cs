using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Models;

namespace XeynergyCodeChallenge.Repositories.SqlServer
{
    public class SQLAdminRepository : IAdminRepository
    {
        private readonly AppDbContext context;

        public SQLAdminRepository(AppDbContext context)
        {
            this.context = context;
        }
        public Admin Add(Admin admin)
        {
            context.Admins.Add(admin);
            context.SaveChanges();
            return admin;
        }

        public Admin Delete(int Id)
        {
            Admin admin = context.Admins.Find(Id);
            if (admin != null)
            {
                context.Admins.Remove(admin);
                context.SaveChanges();
            }
            return admin;
        }

        public Admin GetAdmin(int id)
        {
            return context.Admins.Include(a => a.Person).First(x => x.Id == id);
        }

        public IEnumerable<Admin> GetAllAdmins()
        {
            return context.Admins.Include(a => a.Person);
        }

        public Admin Update(Admin adminChanges)
        {
            var admin = context.Admins.First(x => x.Id == adminChanges.Id);
            admin.Privilege = adminChanges.Privilege;            
            context.SaveChanges();
            return adminChanges;            
        }
    }
}
