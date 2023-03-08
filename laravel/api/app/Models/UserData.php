<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserData extends Model
{
    use HasFactory;

    protected $table = 'user_data';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'address',
        'city',
        'first_name',
        'last_name1',
        'last_name2',
        'country',
        'postal_code'
    ];

    public function user(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(User::class);
    }


}
