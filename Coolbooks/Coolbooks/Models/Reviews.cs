﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Coolbooks.Models;

public partial class Reviews
{
    public int ReviewId { get; set; }

    public int? BookId { get; set; }

    public int? UserId { get; set; }

    public string Title { get; set; }

    public string Text { get; set; }

    public string Rating { get; set; }

    public DateTime? Created { get; set; }

    public virtual Books Book { get; set; }

    public virtual Users User { get; set; }
}