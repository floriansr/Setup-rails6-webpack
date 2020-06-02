### Setup Rails 6 app with webpack

## Application

The idea is to create a small application that can store images in a database (not very clean, but it's for the exotic), but be functional, efficient and modular.

## Topic

For this project, you're gonna have to do it in Ruby 2.7.x. (install it if you don't have it).

Create a new app with Rails 6.0.3; we want :

WebPack
at least the SQLite3 database is available
It is SQlite3 that will be used in the following explanations
Feel free to use something else if you feel like a champion!
2.1 User management (users branch)
With Currency, create a User template that is at least database_authenticatable. We would like everyone to be able to fill in their first_name, last_name, username.

Adds SignIn/Up and logout links. Indicating the Username in the page when you are logged in would be nice too 😉

When it works, you can merge on master

2.2. Display a user... and my profile (profile branch)
We want to be able to display a User's file, but as we are cautious people, we only display his username, first name and the first letter of his last name.

In the route /profile, you want to see your own record: it displays all the business information.

When it works, you can merge on master

2.3 Notion of image (image branch)
Now we have to deal with the notion of image:

An image is "uploaded" by a user; he will be the only one to be able to modify its properties (or delete it).
Despite the fact that it's the (almost absolute) bad thing to do this in normal time, here, we're on a POC so we're going to store the bitstream directly in the base (we'll call it stream)
We can have a small description for each image
Storing the extension of the uploaded file can be useful 😉
From now on, by default, when you get to the app, you'll see the list of images.
Tips:

To encode a stream to base64, you can use the Base64.strict_encode64(<my_stream>) method.
An image encoded in base64 can be stored directly in the source (without the need to search for it with an extra request); basically, we get a tag like this: <img src: "data:image/<extention>;base64,<base64_flow>">.
When it works, you can merge on master

2.4. 🏆 Bonus: a little privacy is nice (private branch)
To be safe, we would like a user to be able to decide that one of his images is private. When this is the case, the image is only visible to the user.

2.5. Notion of comments (comments branch)
We will now allow users to comment on the images. A comment is created by a user and only the user can modify/delete it.

We specify that it is not useful to keep the default views: what interests us is to be able to display the list of comments of an image and to be able to create a new one, all this from the show view of an image.

2.5.1. 🏆 Bonus: Trolley! (my_comments branch)
I would like to have access to the list of all my comments (route /profile/comments).

2.5.2. 🏆 Bonus: a bit of order in this brutal world! (parent branch)
Wouldn't it be nice to allow a comment to be answered? Make it so that one comment can be the answer to another.

2.6. My images (my_images branch)
It'll be useful to be able to get a list of his own images. Create the /profile/images route that lists that.

2.7. Bootstrap (zoli branch)
Well, that's all very nice, but showing that we can integrate a JS library with Webpack is still the idea of the day, isn't it?

Integrate the lib and use a component to show that it works...

2.8. JS code carried by webpack (es6 branch)
Now that you've got all the bricks working, show us that you understand the difference in execution context:

In the image listing page, add a button ... that only executes JS code ... served by webpack (NOT sprockets)

The code in question will simply parse the current page, count the number of images listed and display it somewhere.

## Installation

```
git clone https://github.com/floriansr/Setup-rails6-webpack.git
```

```
cd Setup-rails6-webpack
```

```
bundle install
```

```
rails s
```

## Author

-   **@julienemo** - _Initial work_ - (https://github.com/julienemo)
-   **Florian Sueur** - (https://github.com/floriansr)

