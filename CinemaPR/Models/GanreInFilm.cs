using System;
using System.Collections.Generic;

namespace CinemaPR.Models;

public partial class GanreInFilm
{
    public int Id { get; set; }

    public int FilmFk { get; set; }

    public int GenreFk { get; set; }

    public virtual Film FilmFkNavigation { get; set; } = null!;

    public virtual Genre GenreFkNavigation { get; set; } = null!;
}
