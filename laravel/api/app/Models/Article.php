<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use HasFactory;

    protected $table = 'article';

    protected $fillable = [
        'name',
        'value_property',
        'product_id',
        'property_id',
        'article_father_id',
    ];

    public function articleFather(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(Article::class, 'article_father_id');
    }

    public function articleChildren(): \Illuminate\Database\Eloquent\Relations\HasMany {
        return $this->hasMany(Article::class, 'article_father_id');
    }

    public function product(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(Product::class);
    }

    public function property(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(Property::class);
    }

    public function service(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(Service::class);
    }
}
