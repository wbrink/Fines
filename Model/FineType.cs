using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Fines.Model;

public class FineType
{
    public int FineTypeID { get; set; }

    // [Column("FineType")]
    public string? FineName { get; set; }
    public int FineFee { get; set; }

    // navigation property to see all the fines associated with a fine type
    public ICollection<Fine>? Fines { get; set; }
}

