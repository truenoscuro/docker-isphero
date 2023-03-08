<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    protected $table = 'service';

    protected $fillable = [
        'name',
        'date_expired',
        'is_cancelled',
        'name_domain',
        'article_id',
        'user_id',
    ];

    public function user(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function article(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(Article::class, 'article_id');
    }

}
