<?php

namespace App\Services;

use App\Exceptions\CityNotFoundException;
use Carbon\Carbon;

class WeatherService
{
    protected $conditionService;
    protected $apiService;

    public function __construct(ConditionService $conditionService, ApiService $apiService)
    {
        $this->conditionService = $conditionService;
        $this->apiService = $apiService;
    }

    /**
     * Gets the current weather by city.
     *
     * @param  string  $city
     * @return array
     */
    public function getForecasts($city)
    {
        $this->validateCity($city);
        $forecastUrl = config('weather.places_url') . $city . config('weather.forecast_suffix');
        $forecastData = $this->apiService->fetch($forecastUrl);

        $dates = $this->getDates();
        $weatherForecasts = collect($forecastData['forecastTimestamps'])->whereIn('forecastTimeUtc', $dates);

        return ['city' => $forecastData['place']['name'], 'forecasts' => $weatherForecasts];
    }

    /**
     * Gets date strings for next 3 days.
     *
     * @return array
     */
    private function getDates()
    {
        return [
            Carbon::tomorrow()->toDateTimeString(),
            Carbon::tomorrow()->addDay()->toDateTimeString(),
            Carbon::tomorrow()->addDays(2)->toDateTimeString(),
        ];
    }

    /**
     * Validates city name.
     *
     * @param  string  $city
     * @return void
     */
    private function validateCity($city)
    {
        $placesUrl = config('weather.places_url');
        $availableCities = collect($this->apiService->fetch($placesUrl));

        if (!$availableCities->contains('code', $city)) {
            throw new CityNotFoundException('Requested city (' . $city . ') was not found');
        }
    }
}
