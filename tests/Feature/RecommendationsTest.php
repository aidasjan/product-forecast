<?php

namespace Tests\Feature;

use Carbon\Carbon;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Http;
use Tests\TestCase;

class RecommendationsTest extends TestCase
{
    use RefreshDatabase;

    public function setUp(): void
    {
        parent::setUp();
        $this->seed();
        $this->fakeLocationsResponse = [['code' => 'kaunas']];
        $this->fakeWeatherResponse = [
            'place' => ['name' => 'Kaunas'],
            'forecastTimestamps' => [
                [
                    'forecastTimeUtc' => Carbon::tomorrow()->toDateTimeString(),
                    'airTemperature' => 2,
                    'conditionCode' => 'isolated-clouds',
                ],
                [
                    'forecastTimeUtc' => Carbon::tomorrow()->addDay()->toDateTimeString(),
                    'airTemperature' => 20,
                    'conditionCode' => 'clear',
                ],
                [
                    'forecastTimeUtc' => Carbon::tomorrow()->addDays(2)->toDateTimeString(),
                    'airTemperature' => 15,
                    'conditionCode' => 'isolated-clouds',
                ]
            ]
        ];
    }

    public function testGetsRecommendationsSuccessfully()
    {
        $placesUrl = config('weather.places_url');
        $weatherUrl = config('weather.places_url') . 'kaunas' . config('weather.forecast_suffix');
        Http::fake([
            $placesUrl => Http::response($this->fakeLocationsResponse, 200),
            $weatherUrl => Http::response($this->fakeWeatherResponse, 200),
        ]);

        $response = $this->get('/api/products/recommended/kaunas');

        $response->assertOk();
        $result = $response->json();
        $this->assertCount(3, $result['recommendations']);
        $this->assertCount(2, $result['recommendations'][0]['products']);
        $this->assertEquals('Black jeans', $result['recommendations'][0]['products'][0]['name']);
        $this->assertEquals('White scarf', $result['recommendations'][0]['products'][1]['name']);
        $this->assertEquals('SPR001', $result['recommendations'][2]['products'][0]['code']);
    }

    public function testSetsForecastsCorrectly()
    {
        $placesUrl = config('weather.places_url');
        $weatherUrl = config('weather.places_url') . 'kaunas' . config('weather.forecast_suffix');
        Http::fake([
            $placesUrl => Http::response($this->fakeLocationsResponse, 200),
            $weatherUrl => Http::response($this->fakeWeatherResponse, 200),
        ]);

        $response = $this->get('/api/products/recommended/kaunas');

        $response->assertOk();
        $result = $response->json();
        $this->assertEquals('isolated-clouds', $result['recommendations'][0]['forecast']);
        $this->assertEquals('clear', $result['recommendations'][1]['forecast']);
        $this->assertEquals('isolated-clouds', $result['recommendations'][2]['forecast']);
    }

    public function testReturnsNotFoundWhenCityIsIncorrect()
    {
        $placesUrl = config('weather.places_url');
        $weatherUrl = config('weather.places_url') . 'fake' . config('weather.forecast_suffix');
        Http::fake([
            $placesUrl => Http::response([], 404),
            $weatherUrl => Http::response([], 404),
        ]);

        $response = $this->get('/api/products/recommended/fake');
        
        $response->assertNotFound();
    }
}
