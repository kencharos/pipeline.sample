using System;
using Xunit;
using PipelineSample;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using System.Linq;

namespace PipelineSample.Test
{
    public class PersonServiceTest :IDisposable
    {
        readonly SampleDbContext _ctx;

        //TODO environment variable.
        readonly static string ConnectionString = "Server=127.0.0.1,143;Database=PersonServiceTest;User=sa;Password=SqlServerPass01";

        public PersonServiceTest()
        {
            var builder = new DbContextOptionsBuilder<SampleDbContext>()
                .UseSqlServer(ConnectionString);

            _ctx = new SampleDbContext(builder.Options);

            // create database from entity classes if absent.
            _ctx.Database.EnsureCreated();
            // insert initial data;
            _ctx.Person.Add(new Person { Name = "name1", Age = 11 });
            _ctx.Person.Add(new Person { Name = "name2", Age = 12 });
            _ctx.SaveChanges();
        }

        public void Dispose()
        {
            // delete databse.
            _ctx.Database.EnsureDeleted();
        }

        [Fact]
        public async Task TestFindAll()
        {
            var target = new PersonService(_ctx);
            Assert.Equal(2, (await target.FindAll()).Count());

        }


    }
}
