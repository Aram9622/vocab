<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use Illuminate\Http\Request;

class NewPhrasesController extends ApiController
{
    protected $type = 'phrases';

    use Categories;
}
