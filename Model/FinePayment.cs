using System.ComponentModel.DataAnnotations.Schema;

namespace Fines.Model;
[Table("FinePayment")]
public class FinePayment
{
    public int FinePaymentID { get; set; }
    public int FineID { get; set; }
    public DateTime FinePaymentDate { get; set; }
    public int FinePaymentAmount { get; set; }


}