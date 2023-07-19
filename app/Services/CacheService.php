<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;

class CacheService
{
    /**
     * Gets value from cache.
     *
     * @param  string  $key
     * @return void
     */
    public function get($key)
    {
        return Cache::get($key);
    }

    /**
     * Saves value to cache.
     *
     * @param  string  $key
     * @param  mixed   $value
     * @param  int     $expiration
     * @return void
     */
    public function put($key, $value, $expiration)
    {
        Cache::store('file')->put($key, $value, $expiration);
    }
}
