using System;
using System.Collections.Generic;

namespace CinemaPR.Models;

public partial class Film
{
    public int Id { get; set; }

    public int? Length { get; set; }

    public string? Names { get; set; }

    public virtual ICollection<GanreInFilm> GanreInFilms { get; set; } = new List<GanreInFilm>();

    public virtual ICollection<Sean> Seans { get; set; } = new List<Sean>();
}
