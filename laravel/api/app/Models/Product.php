<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'product';

    protected $fillable = [
        'name',
        'category_id',
    ];

    public function category(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(Category::class);
    }

}
