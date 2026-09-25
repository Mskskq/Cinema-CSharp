using System;
using System.Collections.Generic;

namespace CinemaPR.Models;

public partial class Genre
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<GanreInFilm> GanreInFilms { get; set; } = new List<GanreInFilm>();
}
