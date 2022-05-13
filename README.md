# blog-app-api-practice

Blog app: add API endpoints project where, as the name indicates, I had to add API endpoints to the already created project in the Social Media website. The endpoints created are for the following actions:

- List all posts for a user.
- List all comments for a user's post.
- Add a comment to a post.
- Implement authentication

Since the original project, authentication was implemented with the devise gem. For the API project authentication was implemented with the jwt gem in a separate way, such that both the original project with the frontend in .erb views and also the API project with the particular endpoints requested lived together. All the API endpoints controller are located in it's respective API namespace folder inside the controller's directory.

## Built With

- Ruby 2.7.0
- Rails 6.0.3.4

## Getting Started

To get a local copy up and running follow these simple example steps.

### Setup

If not using ruby version 2.7.0, please install with rvm

```
  rvm install ruby-2.7.0
```

After installing the ruby version, run the command to use that version of ruby

```
  rvm use ruby-2.7.0
```

Install gems with:

```
bundle install
```

Install node packages with yarn

```
yarn install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage the Web App

To start the server and use it on the browser, run:

```
    rails server
```

Open `http://localhost:3000/` in your browser.


### Usage the API

You can test the API endpoints with an app that sends HTTP Requests such as Postman. Have the app running with

```
  rails s
```

The API endpoints are:

For all the Posts of a particular User

```
GET localhost:3000/api/users/:user_id/posts
```

For all the Comments on a particular Post for a User

```
  GET localhost:3000/api/users/:user_id/posts/:post_id/comments
```

For adding a Comment on a particular Post for a User

```
  POST localhost:3000/api/users/:user_id/posts/:post_id/comments
```

### Run tests

Download and install google chrome if don't have it to run Capybara.
Capybara needs the web drivers to run system tests with browsers

``` 
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	
```

``` 
  rspec --format documentation

```

To run the tests of just the API endpoints, run

rspec spec/controllers


## Author

- 👤GitHub: [Jose Abel Ramirez](https://github.com/jose-Abel)
- Linkedin: [Jose Abel Ramirez Frontany](https://www.linkedin.com/in/joseabelramirezfrontany/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

A special thanks to the Ruby Team.