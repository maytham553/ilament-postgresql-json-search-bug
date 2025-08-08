<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $products = [
            [
                'name' => [
                    'ar' => 'نظارة سولار برو',
                    'en' => 'Solar Pro Eyewear',
                ],
            ],
            [
                'name' => [
                    'ar' => 'نظارة شمسية أوكلي',
                    'en' => 'Oakley Sunglasses',
                ],
            ],
            [
                'name' => [
                    'ar' => 'نظارة برادا',
                    'en' => 'Prada Eyewear',
                ],
            ],
            [
                'name' => [
                    'ar' => 'نظارة غوتشي',
                    'en' => 'Gucci Glasses',
                ],
            ],
            [
                'name' => [
                    'ar' => 'نظارة تومي هيلفيغر',
                    'en' => 'Tommy Hilfiger Eyewear',
                ],
            ],
        ];

        foreach ($products as $productData) {
            $product = new Product;
            $product->setTranslation('name', 'ar', $productData['name']['ar']);
            $product->setTranslation('name', 'en', $productData['name']['en']);
            $product->save();
        }
    }
}
