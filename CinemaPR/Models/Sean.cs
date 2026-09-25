using System;
using System.Collections.Generic;

namespace CinemaPR.Models;

public partial class Sean
{
    public int Id { get; set; }

    public int FkFilm { get; set; }

    public decimal Price { get; set; }

    public DateTimeOffset DateTime { get; set; }

    public int HallFk { get; set; }

    public virtual Film FkFilmNavigation { get; set; } = null!;

    public virtual Hall HallFkNavigation { get; set; } = null!;

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}
