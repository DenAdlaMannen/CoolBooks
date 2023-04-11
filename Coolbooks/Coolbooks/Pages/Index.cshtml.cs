using Coolbooks.Data;
using Coolbooks.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Coolbooks.Pages
{
	public class IndexModel : PageModel
	{
		private readonly CoolBookContext _db;

		public IEnumerable<Book> Books { get; set; }

		public IndexModel(CoolBookContext db)
		{
			_db = db;
		}

		public void OnGet()
		{
			Books = _db.Books;
		}
	}

}
