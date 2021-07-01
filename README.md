# Instructions
Some instructions to run the web app:

I have 2 hardcoded users that you can generate with `mix ecto.reset`.

One is an admin and the other is a username.
Username: 'admin'
Password: 't'

Username: 'user'
Password: 't'

User 'user' already has an API key which we will be using for testing. 
API key of User user: 
name: firstKey
key: MyFancyHeader:!ZTHFdFzKCI2DCTPe3y4I?

Feel free to change languages at any time. Changing languages will redirect you to the home page. 
The English and Dutch translations should be accurate but the Japanse sure isn't.

## Logging in


For this purpose, log in as user.
After logging in, you're redirected to the dashboard page. This one is empty for now, because there
are no pets added yet. You can go to profile and try to edit / change your password.

## Testing the API
Please make an api key with a name you want to and save the key and the name. (On Notepad, for example.)

You can now go back and open up Postman and load in the "pets.postman_collection.json" file.

Feel free to disable the name / key headers to get an 'error' message (which is intended).

# POST request

Open it up and try to put a POST request to the link in the bar without touching the headers or bodies.
You'll see a cat is added. 
Now, go to headers and disable either / both key and name. This will give you an error message that the key is wrong. 
Add another animal by your choice. 

# GET request
You can go to the first get and you'll see you get back the cat you just created.

The second get request will do the same but for both pets you just created.

# PUT Request 
Hmm, it seems Lea has become a dog. We'll have to change this.
Send the PUT request and it should come back with the pet being a dog.

# DEL request
Oh no, Lea didn't become a dog, she was just sick and has now died. We'll have to delete her. For this just send the delete request and go check to the get request to get all the pets. You'll see she is now gone. 

Now, this was it for API testing. For the rest you can freely roam on the site. 





