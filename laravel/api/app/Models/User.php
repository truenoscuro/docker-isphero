<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    protected $table = 'user';
    protected $fillable = [];

    protected $guarded = [
        'id',
        'password',
    ];
    protected $primaryKey = 'id';

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public $timestamps = false;

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function userData(): \Illuminate\Database\Eloquent\Relations\HasOne {
        return $this->hasOne(UserData::class);
    }

    public function services(): \Illuminate\Database\Eloquent\Relations\HasMany {
        return $this->hasMany(Service::class);
    }

    public function waitingDomains(): \Illuminate\Database\Eloquent\Relations\HasMany {
        return $this->hasMany(Waiting_Domain::class);
    }

}
