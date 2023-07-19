<?php

namespace App\Services;

use App\Exceptions\NoRecommendationsException;

class RecommendationService
{
    protected $collectionService;
    protected $conditionService;
    protected $productService;
    
    public function __construct(CollectionService $collectionService, ConditionService $conditionService, ProductService $productService)
    {
        $this->collectionService = $collectionService;
        $this->conditionService = $conditionService;
        $this->productService = $productService;
    }

    /**
     * Returns list of products that are recommended for forecasts.
     *
     * @param  Illuminate\Database\Eloquent\Collection  $forecasts
     * @return array
     */
    public function getRecommendedProducts($forecasts)
    {
        return $forecasts->map(function ($forecast) {
            return $this->getRecommendedProductsByWeather($forecast);
        })->values();
    }

    /**
     * Returns list of products that are recommended for specified weather.
     *
     * @param  object  $weather
     * @return Illuminate\Database\Eloquent\Collection
     */
    private function getRecommendedProductsByWeather($forecast)
    {
        $collections = $this->collectionService->getCollectionsByTemperature($forecast['airTemperature']);
        $condition = $this->conditionService->getConditionByCode($forecast['conditionCode']);
        $recommendedProducts = $this->productService->getProductsByCollectionsAndRecommendations($collections, $condition->recommendations);
        if (count($recommendedProducts) == 0) {
            throw new NoRecommendationsException('No recommendations could be provided' .
                ', condition: ' . $forecast['conditionCode'] . ', temperature: ' . $forecast['airTemperature']);
        }
        return ['forecast' => $forecast['conditionCode'], 'date' => $forecast['forecastTimeUtc'], 'products' => $recommendedProducts];
    }
}
