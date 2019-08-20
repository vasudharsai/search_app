Search Application
=====================

This Search application is a part of coding assessment by Zendesk Hiring Team. Using latest Rails(5.2) and ruby(2.5.3)
versions


Prerequisites
The setups steps expect following tools installed on the system.

Github
Ruby 2.5.3
Rails 5.2.3

1. Check out the repository
git clone git@github.com:vasudharsai/search_app.git

2. Checkout to develop branch
git init
git checkout develop
git pull - just to make sure you have the latest from develop

3. Load external libraries
bundle

4. Setup and load the database
Run the following commands to create and setup the database.

bundle exec rake db:migrate

bundle exec rake import:organizations               # Import all organizations
bundle exec rake import:tickets                     # Import all users
bundle exec rake import:users                       # Import all users

You can start the rails server using the command given below.

bundle exec rails s

And now you can visit the site with the URL http://localhost:3000


Instructions to setup Test Suite

Importing data into test suite to have more options for searching

bundle exec rake import:organizations RAILS_ENV=test              # Import all organizations
bundle exec rake import:tickets RAILS_ENV=test                    # Import all users
bundle exec rake import:users RAILS_ENV=test                      # Import all users

bundle exec rspec spec 
