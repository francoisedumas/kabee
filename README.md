### RoR / Vue.js Workshop
## Introduction to Vue.js using Ruby on Rails for the back
The target is to build a simple feedback application using 
 - RoR as an API back end
 - Vue.js for the front end

## Starting with API back end
### Rails new
Let's start by creating a new Rails app calling Vue.js with Webpack
```
rails new kabee --webpack=vue --database=postgresql

cd kabee
git add . && git commit -m "rails new"
gh repo create
git push origin master
```
### Creating the DB
```
rails db:create
rails db:migrate RAILS_ENV=development
```
### Authentification with Devise and User model creation
We will use Devise for the authentification and to create the user model
```
# Gemfile
gem 'devise'

bundle install
rails generate devise:install

rails generate devise User
rails db:migrate

rails generate migration AddNameToUser first_name:string last_name:string
rails db:migrate
```
