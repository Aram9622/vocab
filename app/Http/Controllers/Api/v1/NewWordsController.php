<?php

namespace App\Http\Controllers\Api\v1;

use Illuminate\Http\Request;

class NewWordsController extends ApiController
{
    use Categories;

    protected $type = 'words';
}
