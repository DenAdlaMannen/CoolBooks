using Coolbooks.Data;
using Coolbooks.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Coolbooks.Pages
{
	public class IndexModel : PageModel
	{
		//private readonly ILogger<IndexModel> _logger;
		private readonly ApplicationDbContext _db;

		public IEnumerable<Books> Books { get; set; }
		public IndexModel(ApplicationDbContext db)
		{
			_db = db;
		}

		public void OnGet()
		{
			Books = _db.Books;
		}





        //private readonly ApplicationDbContext _db;
        //public IEnumerable<Category> Categories { get; set; }
        //public IndexModel(ApplicationDbContext db)
        //{
        //    _db = db;
        //}
        //public void OnGet()
        //{
        //    Categories = _db.Categories;
        //}
    }
}