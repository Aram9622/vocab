<?php

namespace App\Http\Controllers\Api\v1;

use Illuminate\Http\Request;

class NewPhrasesController extends ApiController
{
    use Categories;

    protected $type = 'phrases';
}
