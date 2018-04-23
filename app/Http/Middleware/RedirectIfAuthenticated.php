<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->check()) {
            auth()->logout(); // logout user     (1)
            // return redirect('/');  // default
            
            // redirect to login (2)
            // at this point the user can't login because there is a restriction 
            // all new registrations are created with admin = '0' 
            // see /App/Http/Controllers/Auth/LoginController.php  'credentials'  method
            return redirect('/login'); 
        }

        return $next($request);
    }
}
