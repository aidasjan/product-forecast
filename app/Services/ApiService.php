<?php

namespace App\Services;

use App\Exceptions\ApiException;
use Exception;
use Illuminate\Support\Facades\Http;

class ApiService
{
    /**
     * Fetches collection from external API.
     *
     * @param  string  $url
     * @return array
     */
    public function fetch($url)
    {
        try {
            $response = Http::get($url);
            $data = $response->json();
            return $data;
        } catch (Exception $exception) {
            throw new ApiException("API request failed: " . $exception->getMessage());
        }
    }
}
