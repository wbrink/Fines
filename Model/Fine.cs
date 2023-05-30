using System.ComponentModel.DataAnnotations.Schema;

namespace Fines.Model;

[Table("Fines")]
public class Fine
{
    public int FineID { get; set; }
    public DateTime FineMade { get; set; }
    public int FineAmount { get; set; }
    public int StudentID { get; set; }
    public string? StudentFirstName { get; set; }
    public string? StudentLastName { get; set; }
    public string? StudentSchool { get; set; }
    public string? DamagedComputerFileLocation { get; set; }
    public string? Notes { get; set; }
    // this is the foreign key to get the type of fine
    public int FineTypeID { get; set; }
    public bool FineCompleted { get; set; }

    //navigation property to see payments on this fine
    public ICollection<FinePayment>? FinePayments { get; set; }
}

