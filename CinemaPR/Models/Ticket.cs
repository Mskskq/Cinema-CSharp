using System;
using System.Collections.Generic;

namespace CinemaPR.Models;

public partial class Ticket
{
    public int Id { get; set; }

    public int NumberSeatFk { get; set; }

    public int SeansFk { get; set; }

    public virtual Sean SeansFkNavigation { get; set; } = null!;
}
