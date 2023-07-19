<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Condition extends Model
{
    use HasFactory;

    public function recommendations()
    {
        return $this->hasMany('App\Models\Recommendation', 'condition_id');
    }
}
