# lekki-properties-api
A property management API built with Ruby on Rails. You can create a new property, update a property, get a property, or delete a property. This is summarily a simple API to perform basic CRUD operations on properties/apartments.

## Running the API
To run this app locally WITHOUT DOCKER, run the following commands:
* **rake db:create** (this creates the database)
* **rake db:migrate** (this runs all migrations)
* **rails server** (this gets the server running)

To run this app WITH DOCKER, run the following commands:
* **docker-compose build** (this builds the image)
* **docker-compose run app rake db:create db:migrate** (this creates the database and runs all migrations)
* **docker-compose up** (this gets the server running)

## Testing the API
To view the API documentation, go to localhost:3000/api-docs on your browser. You can call the endpoints using an API testing tool such as Postman.
