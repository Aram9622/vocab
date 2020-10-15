<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Studied extends Model
{
    protected $table = 'studied';

    protected $fillable = ['studied_id', 'type', 'percent'];
}
