<?php

namespace App\Http\Controllers\Api\v1;

use Illuminate\Http\Request;

class NewVerbsController extends ApiController
{
    use Categories;

    protected $type = 'verbs';
}
