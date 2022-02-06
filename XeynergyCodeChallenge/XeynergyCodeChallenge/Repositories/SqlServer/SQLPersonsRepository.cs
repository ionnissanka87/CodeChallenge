using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Models;

namespace XeynergyCodeChallenge.Repositories.SqlServer
{
    public class SQLPersonsRepository : IPersonsRepository
    {
        private readonly AppDbContext context;

        public SQLPersonsRepository(AppDbContext context)
        {
            this.context = context;
        }

        public Person Add(Person person)
        {
            context.Persons.Add(person);
            context.SaveChanges();
            return person;
        }

        public Person Delete(int Id)
        {
            Person person = context.Persons.Find(Id);
            if (person != null)
            {
                context.Persons.Remove(person);
                context.SaveChanges();
            }
            return person;
        }

        public IEnumerable<Person> GetAllPersons()
        {
            return context.Persons;
        }

        public Person GetPerson(int Id)
        {            
            return context.Persons.Find(Id);
        }

        public Person Update(Person personChanges)
        {
            var person = context.Persons.Attach(personChanges);
            person.State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            context.SaveChanges();
            return personChanges;            
        }
    }
}
