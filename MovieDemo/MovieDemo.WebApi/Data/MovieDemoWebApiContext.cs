using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using MovieDemo.WebApi.Models;

namespace MovieDemo.WebApi.Models
{
    public class MovieDemoWebApiContext : DbContext
    {
        public MovieDemoWebApiContext (DbContextOptions<MovieDemoWebApiContext> options)
            : base(options)
        {
        }

        public DbSet<MovieDemo.WebApi.Models.Movie> Movies { get; set; }

        public DbSet<MovieDemo.WebApi.Models.Category> Categories { get; set; }
    }
}
