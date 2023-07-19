<?php

namespace App\Services;

use App\Models\Condition;
use App\Exceptions\ObjectNotFoundException;

class ConditionService
{
    /**
     * Gets condition by code.
     *
     * @param  string  $code
     * @return object
     */
    public function getConditionByCode($code)
    {
        $condition = Condition::where('code', $code)->first();
        if ($condition === null) {
            throw new ObjectNotFoundException('Condition not found: ' . $code);
        }
        return $condition;
    }
}
