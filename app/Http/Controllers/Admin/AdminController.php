<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Option;

class AdminController extends Controller
{
    protected $model;

    public function __construct(Option $model)
    {
        $this->model = $model;
    }

    public function help()
    {
        $title = 'Help';
        $name = 'help';

        return view('Admin.pages.info.index', compact('title', 'name'));
    }

    public function store(Request $request)
    {
        if ($request->faq) {
            Option::setItem('faq', $request->faq);
        }

        return back();
    }
}
