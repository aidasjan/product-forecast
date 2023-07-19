<?php

namespace App\Exceptions;

use Exception;

class NoRecommendationsException extends Exception
{
    public function render()
    {
        return response()->json([
            'message' => $this->message,
        ], 404);
    }
}
