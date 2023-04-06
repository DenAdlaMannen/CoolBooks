using Coolbooks.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Coolbooks.Pages
{
	public class IndexModel : PageModel
	{
		//private readonly ILogger<IndexModel> _logger;
		private readonly ApplicationDbcontext _db;

		public IEnumerable<Books> Books { get; set; }
		public IndexModel(ApplicationDbcontext db)
		{
			_db = db;
		}

		public void OnGet()
		{
			Books = _db.
		}
	}
}