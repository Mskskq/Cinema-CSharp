using System;
using System.Collections.Generic;

namespace CinemaPR.Models;

public partial class Hall
{
    public int Id { get; set; }

    public int CountSeat { get; set; }

    public virtual ICollection<Sean> Seans { get; set; } = new List<Sean>();
}
