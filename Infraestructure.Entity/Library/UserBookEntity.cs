using Infraestructure.Entity.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Infraestructure.Entity.Library
{
    [Table("UserBook", Schema = "Library")]
    public class UserBookEntity
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("BooksEntity")]
        public int IdBook { get; set; }
        public BooksEntity  BooksEntity{ get; set; }

        [ForeignKey("UserEntity")]
        public int IdUser { get; set; }
        public UserEntity UserEntity { get; set; }
    }
}
