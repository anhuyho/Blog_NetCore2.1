using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Models
{
    public abstract class BaseEntity
    {
        [Required]
        public int Id { get; set; }
    }
    public class Post: BaseEntity
    {
        
        public string Title { get; set; } = string.Empty;
        public string Body { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;
        public DateTime Created { get; set; } = DateTime.Now;
    }
}
