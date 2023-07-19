<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\CacheService;
use App\Services\RecommendationService;
use App\Services\WeatherService;

class RecommendationsController extends Controller
{
    protected $weatherService;
    protected $recommendationService;
    protected $cacheService;

    public function __construct(WeatherService $weatherService, RecommendationService $recommendationService, CacheService $cacheService)
    {
        $this->weatherService = $weatherService;
        $this->recommendationService = $recommendationService;
        $this->cacheService = $cacheService;
    }

    /**
     * Returns recommended products.
     *
     * @param  string  $city
     * @return \Illuminate\Http\Response
     */
    public function show($city)
    {
        $cachedRecommendations = $this->cacheService->get(config('recommendations.cache_key') . $city);
        if ($cachedRecommendations !== null) {
            return $cachedRecommendations;
        }

        $forecasts = $this->weatherService->getForecasts($city);
        $recommendedProducts = $this->recommendationService->getRecommendedProducts($forecasts['forecasts']);
        $recommendations = ['city' => $forecasts['city'], 'recommendations' => $recommendedProducts];
        $this->cacheService->put(config('recommendations.cache_key') . $city, $recommendations, config('recommendations.cache_expiration'));
        return $recommendations;
    }
}
