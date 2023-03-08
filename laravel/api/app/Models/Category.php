<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $table = 'category';

    protected $fillable = [
        'name',
        'category_father_id',
    ];

    public function categoryFather(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(Category::class, 'category_father_id');
    }

    public function categoryChildren(): \Illuminate\Database\Eloquent\Relations\HasMany {
        return $this->hasMany(Category::class, 'category_father_id');
    }

    public function products(): \Illuminate\Database\Eloquent\Relations\HasMany {
        return $this->hasMany(Product::class);
    }
}
