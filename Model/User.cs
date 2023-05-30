using System.ComponentModel.DataAnnotations.Schema;

namespace Fines.Model;

[Table("Users")]
public class User 
{
   public int UserID { get; set; }
   public string? UserPassword { get; set; }
   public string? UserEmail { get; set; }
   public DateTime DateJoined { get; set; }
   public string? UserRole { get; set; }
}