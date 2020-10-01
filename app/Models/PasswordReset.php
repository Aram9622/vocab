<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PasswordReset extends Model
{
    public $primaryKey = 'email';

    public $timestamps = false;

    protected $fillable = [
        'email', 'token'
    ];
}
