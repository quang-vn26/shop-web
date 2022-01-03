<?php

namespace App\Http\Middleware;

use Closure;

class Seller
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
        if($request->user()->role=='seller'){
            return $next($request);
        }
        else{
            // request()->session()->flash('error','Bạn không có thể truy cập trang này');
            return redirect()->route($request->user()->role);
        }
    }
}
