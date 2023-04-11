using Coolbooks.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Coolbooks.Pages
{
    public class BooklistModel : PageModel
    {
        private readonly CoolBookContext _db;

        public IEnumerable<Book> Books { get; set; }

        public BooklistModel(CoolBookContext db)
        {
            _db = db;
        }

        public void OnGet()
        {
            Books = _db.Books.Include(c => c.Author);
        }
    }
}

