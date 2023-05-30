using Microsoft.EntityFrameworkCore;
using Fines.Model;

namespace Fines.DB;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
    {
    }

    public DbSet<Fine>? Fines { get; set; }
    public DbSet<FinePayment>? FinePayments {get; set;}
    public DbSet<FineType>? FineTypes {get; set;}
    public DbSet<User>? Users {get; set;}

}