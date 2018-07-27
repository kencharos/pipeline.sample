using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace PipelineSample
{
    // using database class
    public class PersonService
    {
        readonly SampleDbContext _ctx;

        public PersonService(SampleDbContext ctx)
        {
            _ctx = ctx;
        }

        public async Task<IEnumerable<Person>> FindAll()
        {
            return await _ctx.Person.ToListAsync();
        }
    }
}
