using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XeynergyCodeChallenge.Models;

namespace XeynergyCodeChallenge.Repositories
{
    public interface IPersonsRepository
    {
        Person GetPerson(int Id);
        IEnumerable<Person> GetAllPersons();
        Person Add(Person person);
        Person Update(Person personChanges);
        Person Delete(int Id);
    }
}
