<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use Illuminate\Http\Request;

class NewVerbsController extends ApiController
{
    use Categories;

    protected $type = 'verbs';
}
