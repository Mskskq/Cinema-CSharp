using CinemaPR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaPR
{
    public class ObjectCeans
    {
        public Sean Sean { get; set; }
        public string FilmName { get; set; }    
        public int? Length { get; set; }        
        public decimal Price { get; set; }    
        public DateTimeOffset Time { get; set; }     // Время начала (тип TimeSpan из-за time with time zone)
        public int HallNumber { get; set; }
    }
}
