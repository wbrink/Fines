using Microsoft.EntityFrameworkCore;
namespace Fines.DB;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
    {

    }

    
}