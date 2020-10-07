<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use Illuminate\Http\Request;

class NewWordsController extends ApiController
{
    use Categories;

    protected $type = 'words';
}
