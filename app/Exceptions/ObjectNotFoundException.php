<?php

namespace App\Exceptions;

use Exception;

class ObjectNotFoundException extends Exception
{
    public function render()
    {
        return response()->json([
            'message' => $this->message,
        ], 404);
    }
}
