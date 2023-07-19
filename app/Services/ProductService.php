<?php

namespace App\Services;

use App\Models\Product;

class ProductService
{
    /**
     * Returns a list of products that are recommended based on collections and recommendations.
     *
     * @param  object  $collections
     * @param  object  $recommendations
     * @return array
     */
    public function getProductsByCollectionsAndRecommendations($collections, $recommendations)
    {
        $collectionIds = $collections->pluck('id')->toArray();
        $recommendationProductIds = $recommendations->pluck('product_id')->toArray();
        $products = Product::whereIn('collection_id', $collectionIds)
            ->whereIn('id', $recommendationProductIds)
            ->take(config('recommendations.products_limit'))
            ->get();
        return $products;
    }
}
