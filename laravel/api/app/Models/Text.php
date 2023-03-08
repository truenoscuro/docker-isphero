<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Text extends Model
{
    use HasFactory;

    protected $table = "translate_page";
    public $timestamps = false;

    protected $fillable = [
        'key_text_id',
        'lang_code',
        'translate'
    ];
}
