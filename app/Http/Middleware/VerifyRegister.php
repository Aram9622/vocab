<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\MustVerifyEmail;

class VerifyRegister
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (! $request->user() ||
            ($request->user() instanceof MustVerifyEmail &&
                ! $request->user()->hasVerifiedEmail())) {

            return response()->json(['message' => 'Your email address is not verified.']);
        }

        return $next($request);
    }
}
