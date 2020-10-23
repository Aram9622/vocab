<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Studied extends Model
{
    protected $table = 'studied';

    protected $fillable = ['user_id', 'studied_id', 'type', 'percent'];
}
