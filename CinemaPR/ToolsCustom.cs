using CinemaPR.Models;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaPR
{
    public class ToolsCustom
    {
        public List<object> GetListObjectCeans(CinemaContext DataBase)
        {
            List<ObjectCeans> ListObjectCeans = new List<ObjectCeans>();
            var ListCeansBD = DataBase.Seans.ToList();
            foreach(Sean ItemCeans in ListCeansBD)
            {
                GanreInFilm GenreINBD = DataBase.GanreInFilms.Where(x => x.FilmFk == ItemCeans.FkFilm).ToList().FirstOrDefault();

                var ItemObjectCeans = new ObjectCeans
                {
                     

                };
            }

            return null;
        }
    }
}
