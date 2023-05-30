using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Fines.DB;
using Fines.Model;

namespace Fines.Pages;

public class IndexModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;
    public ApplicationDbContext _context;
    public List<User>? Users { get; set; }

    public IndexModel(ILogger<IndexModel> logger, ApplicationDbContext context)
    {
        _context = context;
        _logger = logger;
        
    }

    public void OnGet()
    {
        Users = _context.Users.ToList();
    }

}
