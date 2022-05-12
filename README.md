# blog-app-api-practice

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



### Run tests

Download and install google chrome if don't have it to run Capybara.
Capybara needs the web drivers to run system tests with browsers

``` 
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb
	
```

``` 
  rspec --format documentation

```

### Deployment

Steps to deploy to Heroku run in the console the following commands:

```
  heroku login -i

  <login with your Heroku credentials>

  heroku create

  heroku rename <the name you want for your app>

  heroku run rails db:migrate

```
After the previous steps, make sure you add your database password to your Heroku environment variables with the key-value pairs being the key locate in config/database.yml and the value the password you set up.

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