# ProductForecast

ProductForecast is a service that returns product recommendations based on weather predictions at requested location.

The weather information is based on Meteo.lt API ([api.meteo.lt](https://api.meteo.lt)) which is provided by LHMT.

### Approach and Data Structure

Product recommendations are based on the weather condition and temperature at specified location.

All products belong to ```collections```, that have specified minimum and maximum temperature. In addition, there are special ```recommendations``` that specify which products could be recommended at certain weather conditions.

## Setup

Provide connections to database (host, port, username and password) using environment variables (e.g. in .env file - example is in the project's root directory ```/.env.example```). 

Run database migrations using ```php artisan migrate:fresh```. 

Database can be seeded with test data using ```php artisan db:seed```.

Other requirements and more info [here](https://laravel.com/docs/master/installation)

## Usage

### API

Send the following request:

``` bash
GET /api/products/recommended/{city}
```

Here ```{city}``` is a custom name of a place. The product list will be based on a weather forecast in this place.

Response with the following data in JSON format will be sent back:
- ```city``` - string. Requested city.
- ```recommendations``` - array. Array of recommendations.

Information about every recommended product:
- ```id``` - integer. ID of item in database.
- ```code``` - string. Product code.
- ```name``` - string. Product name.
- ```price``` - double. Price of a product.
- ```collection_id``` - integer. ID of product's collection.
- ```created_at``` - string. Timestamp of object creation.
- ```updated_at``` - string. Timestamp of object update.

### Tests

Tests are located in ```/tests```.

Execute tests with the following command:
``` bash
vendor\bin\phpunit
```

## Remote usage

**API** is available at **[productforecast.herokuapp.com/api/products/recommended/{city}](https://productforecast.herokuapp.com/api/products/recommended/vilnius)**

## Technologies

This service was made by using:
- Laravel Framework 8.80.0 ([laravel.com](https://laravel.com))
- MySQL 8.0
- PHP 8.1.2

## Example

**Request:** 
``` bash
GET /api/products/recommended/kaunas
```

**Response:**
```
{
  "city": "Kaunas",
  "recommendations": [
    {
      "forecast": "isolated-clouds",
      "date": "2022-02-22 00:00:00",
      "products": [
        {
          "id": 16,
          "code": "AUT001",
          "name": "Black jeans",
          "price": 24.99,
          "collection_id": 2,
          "created_at": "2019-10-23T00:00:00.000000Z",
          "updated_at": "2019-10-23T00:00:00.000000Z"
        },
        {
          "id": 17,
          "code": "AUT002",
          "name": "White scarf",
          "price": 3.99,
          "collection_id": 2,
          "created_at": "2019-10-23T00:00:00.000000Z",
          "updated_at": "2019-10-23T00:00:00.000000Z"
        }
      ]
    },
    {
      "forecast": "clear",
      "date": "2022-02-23 00:00:00",
      "products": [
        {
          "id": 15,
          "code": "WIN005",
          "name": "Blue winter jacket",
          "price": 58.99,
          "collection_id": 4,
          "created_at": "2019-10-23T00:00:00.000000Z",
          "updated_at": "2019-10-23T00:00:00.000000Z"
        }
      ]
    },
    {
      "forecast": "clear",
      "date": "2022-02-24 00:00:00",
      "products": [
        {
          "id": 15,
          "code": "WIN005",
          "name": "Blue winter jacket",
          "price": 58.99,
          "collection_id": 4,
          "created_at": "2019-10-23T00:00:00.000000Z",
          "updated_at": "2019-10-23T00:00:00.000000Z"
        }
      ]
    }
  ]
}
```

## Author

**Aidas Jankauskas** (aidas.jankauskas31@gmail.com)

## Licence

Copyright (c) 2022 Aidas Jankauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.