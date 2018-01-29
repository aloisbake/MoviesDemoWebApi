using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MovieDemo.WebApi.Models
{
    public class Movie
    {
        public int ID { get; set; }
        public string Name { get; set; }
        [ForeignKey("Category")]
        public int CategoryID { get; set; }
        public Category Category { get; set; }
        public string Rating { get; set; }
    }
}
