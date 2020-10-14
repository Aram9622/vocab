<?php

namespace App\Traits;

/**
 * Class View
 */
trait View
{
    public function view($p, $prefix = 'pages', $data = [])
    {
        return $prefix ? view($prefix . '.' . $p, $data) : view($p);
    }
}