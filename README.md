# JOHN
A crowd-sourced restroom locator for mobile and web

## Running
This is a single-page rails application. Start by downloading the repository. Then run ```rails server``` to get it started. In order to use the geolocation services, you will have to run it in chrome (safari requires https protocol, which heroku sets up for production).

## Technologies
  * Bootstrap, bootstrap, bootstrap
  * Rails
  * jQuery

## TODO
- [ ] Add google maps javascript api
  * When clicked, a bathroom should slide up and display an inset with a map
- [ ] Allow users to rate existing bathrooms
  * Persist user ratings in database
- [ ] Implement user authentication
  * Thinking of using okta with devise
- [ ] Throw this bad boy on heroku

  
