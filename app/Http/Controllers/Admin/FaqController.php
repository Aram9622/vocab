<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Traits\View;
use App\Models\Faq;
use Illuminate\Http\Request;

/**
 * Class FaqController
 * @package App\Http\Controllers\Admin
 */
class FaqController extends Controller
{
    use View;

    protected $type = 'faq';

    /**
     * Faq list page.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $model = $this->model()->where('type', $this->type)->orderBy('created_at', 'desc')->paginate(10);

        if ($request->ajax()) {
            $view = $this->view('pages/faq/data', 'Admin')->with('model', $model)->render();
            return response()->json(['html' => $view]);
        }

        return $this->view('pages/' . $this->type . '/index', 'Admin')->with('model', $model);
    }

    /**
     * Create faq page.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return $this->view('pages/' . $this->type . '/create', 'Admin')->with('model', $this->model());
    }

    /**
     * Update faq page.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        return $this->view('pages/' . $this->type . '/update', 'Admin')->with('model', $this->model(intval($request->id)));
    }


    /**
     * Remove faq.
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function remove(Request $request)
    {
        $this->model(intval($request->id))->delete();

        return back();
    }


    /**
     * Save faq.
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function save(Request $request)
    {
        $model = $this->model(intval($request->id));
        $model->fill($request->toArray());
        $validator = $model->validation($request);
        if (!$validator->fails()) {
            if ($model->save()) {
                $request->session()->flash('success', 'Form data successful saved!');
                return redirect()->route('admin.' . $this->type . '.update', $model->id);
            }
        }
        return back();
    }

    /**
     * The Faq model
     *
     * @param int|null $id
     * @return Faq
     */
    public function model($id = null)
    {
        $model = is_int($id) && $id ? Faq::find($id) : new Faq();

        $model->type = $this->type;

        return $model;
    }
}
