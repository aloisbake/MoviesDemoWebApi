using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MovieDemo.WebApi.Models
{
    public class Category
    {
        public int ID { get; set; }
        [Display(Name="Category")]
        public string Name { get; set; }
        public virtual ICollection<Movie> Movies { get; set; }
    }
}
