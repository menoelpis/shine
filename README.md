================================
Rails New
================================

$ rails new --skip-turbolinks \
            --skip-spring     \
            --skip-test-unit  \
            -d postgresql     \
            shine

============================================
PostgreSQL Setup
============================================

$ psql postgres
postgres> CREATE USER shine PASSWORD 'shine'
postgres> ALTER USER shine CREATEDB;

================================
Database Setup
================================

$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rails server

================================
Devise Setup
================================
Gemfile -> gem 'devise', '3.5.6'
$ bundle install
$ bundle exec rails generate devise:install
$ bundle exec rails generate devise user

Restriction on all pages(app/controllers/application_controller.rb)
+ before_action :authenticate_user!

$ bundle exec rake db:migrate
$ bundle exec rails server -> Sign In / Log In

$ bundle exec rails dbconsole
postgres> \x on
postgres> select * from users;