<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mail extends Model
{
    use HasFactory;

    protected $table = 'user';
    protected $fillable = [
        'email',
    ];

    protected $hidden = [
        'password',
        'role',
        'remember_token',
    ];

    function send()
    {
        $email = $this->email;
        $data = array(
            'email' => $email,
        );
    }
}
