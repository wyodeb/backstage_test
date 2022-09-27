# README
* Ruby version: 3.1.2
* Rails version: 6.1.6
* Database Postgres 
* Dev DB version: 14.2
* Additional gems:
  * friendly_id - replaced showed id with UUID 
  * faker - fake data generator
  * rspec-rails - Testing 
  * factory_bot_rails - Testing 
* API specifications:
  * Main endpoint: GET POST api/v1/cars
  * Update endpoint PUT api/v1/cars/:slug
  * Delete endpoint DELETE api/v1/cars/:slug
  * Search by make:
    *  GET api/v1/cars?make=nisan (Nissan, NISAN, niSaN also works)
  * Search by price:
    * api/v1/cars?min_price=3000
    * api/v1/cars?max_price=50000
    * api/v1/cars?min_price=3000&max_price=50000
* There are 12 tests which covers all actions 

* I tried to write code as clean as my knowledge allows. Thank you for considering my application for this role.