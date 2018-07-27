using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace PipelineSample
{
    //entyty
    public class Person
    {
        [Key]
        public long Id { get; set; }

        [Required]
        [StringLength(40)]
        public string Name { get; set; }

        public int Age { get; set; }
    }
    
}
