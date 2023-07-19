<?php

namespace App\Services;

use App\Models\Collection;

class CollectionService
{
    /**
     * Gets collections by temperature.
     *
     * @param  double  $temperature
     * @return array
     */
    public function getCollectionsByTemperature($temperature)
    {
        return Collection::where('temp_min', '<=', $temperature)->where('temp_max', '>', $temperature)->get();
    }
}
