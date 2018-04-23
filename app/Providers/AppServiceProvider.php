<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
// Include Schema
use Illuminate\Support\Facades\Schema;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // https://laravel-news.com/laravel-5-4-key-too-long-error
        // Fix Laravel 5.4  utf8mb4:
        Schema::defaultStringLength(191) ;
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
