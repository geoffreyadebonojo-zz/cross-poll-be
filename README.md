# README

<h1>Adoptr Backend API </h1>

<h3>Hosted on https://adoptr-be.herokuapp.com/ </h3>

This API is built to work with the Adoptr Frontend. The repo for the Adoptr Frontend can be found at https://github.com/colev1/cross-poll-fe. 

<hr>

The endpoints that are available are as follows: 

<h2>post /api/v1/users</h2>
This post request registers a user on the app. Below, you can see the correct way to pass params through the body, as well as the responses that a user will get when registration is successful or not. 

Endpoint to Register a User: 

![alt text](readme_images/post_users.png)

Correct Body to Register a User:

![alt text](readme_images/post_users_correct_body.png)

Response for a Successfull User Registration (users should extract and save the api for later requests during the session): 

![alt text](readme_images/correct_response_session_user.png)

Response for an Errored User Registration: 

![alt text](readme_images/post_users_error_response.png)

Response for an invalid email address:

![alt text](readme_images/invalid_email_response.png)


<ln>
  
  <h2>post /api/v1/sessions</h2>
This post request logs an existing user into the app and store their info in sessions. Below, you can see the correct body format for the request, as well as the two possible responses for a successfull and an errored log in. 

Endpoint to Login a User:

![alt text](readme_images/post_sessions.png)

Correct Body to Log in a User:

![alt text](readme_images/post_sessions_correct_body.png)

Response for a Successfull User Log In (users should extract and save the api for later requests during the session): 

![alt text](readme_images/correct_response_session_user.png)

Response for an Errored User Log In: 

![alt text](readme_images/post_sessions_error_response.png)

<ln>
  
  <h2>get /api/v1/locations</h2>
  
  To get a users zip code, make a get request to /api/v1/locations. 
  The response will return just the zip code where the user is located. It will look as follows: 
  
  ![alt text](readme_images/zip_code.png)

<ln>
  
  <h2>get /api/v1/favorites</h2>
 To get all of the favorites that a user has saved, make a get request to api/v1/favorites and either put the api_token in the body like this: 
 
 ![alt text](readme_images/get_favorites_body.png)
 
Or send the request with api_token as a query param such as 
<h2> api/v1/favorites?api_token=${whateverTheApiTokenIs} </h2>
(Using params will work better than putting it through the body on this get request). 
 
 If a user does not have any favorites saved, and the get request is called, the response will look as follows: 
 
 ![alt text](readme_images/get_favorites_none_saved.png)

 If there are saved favorites for the user, the response will look as follows: 
 
 ![alt text](readme_images/get_favorites_response.png)
 
 
 <ln>
  
  <h2>post /api/v1/favorites</h2>
  
  To save a favorite to a user, send a post request to /api/v1/favorites and provide the following in the body of the request:
  
  ![alt text](readme_images/post_favorites_body.png)
  
  After sending this post request, a successfull post will return the following: 
  
  ![alt text](readme_images/post_favorites_response.png)
  
  If the request does not return properly, it is because the api_token is not associated with a user, and there will be an error message that will say this. 
  
  
   <ln>
  
  <h2>delete /api/v1/favorites</h2>
  
  To delete a favorite that the user had saved, send a delete request to /api/v1/favorites and provide the following in the body of the request: 
  
  ![alt text](readme_images/delete_favorite_body.png)
  
  Right now, the response for a successful request gives back an updated list of that users favorites, but we can change this to a success message in the future. 
  
  ![alt text](readme_images/delete_favorite_response.png)


<h1>Set Up</h1>

Clone this repository and perform the following instructions in your terminal:

1. git clone <github repo link>
2. cd cross-poll-be
 
<h2>Versions</h2>
Adoptr API was developed using Rails 5.2 and Ruby 2.4

<h2>Install</h2>
1. bundle install
2. rake db:{drop,migrate,seed} 
3. rails s (opens server)
4. visit http://localhost:3000 to access api endpoints locally

<h2> Testing </h2>
run 'rspec' in terminal to check testing coverage

<h2>Built With</h2>
Rails
Google API
RSpec
ShouldaMatchers
Capybara
Launchy
SimpleCov
BCrypt
PostreSQL
Figaro

<h2>Author</h2>
Meghan Stang (mstang15)
Geoff Adebonojo (geoffreyadebonojo)
