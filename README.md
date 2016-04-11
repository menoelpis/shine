================================
Rails New
================================

$ rails new --skip-turbolinks \
            --skip-spring     \
            --skip-test-unit  \
            -d postgresql     \
            shine

<note> github-setup
$ git remote show origin
$ git remote set-url origin git+ssh://git@github.com/username/reponame.git

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

============================================
Devise Setup
============================================
[Gemfile] + gem 'devise', '3.5.6'
$ bundle install
$ bundle exec rails generate devise:install
$ bundle exec rails generate devise user

<note>Restriction on all pages
[app/controllers/application_controller.rb]
+ before_action :authenticate_user!

$ bundle exec rake db:migrate
$ bundle exec rails server -> Sign In / Log In

$ bundle exec rails dbconsole
postgres> \x on
postgres> select * from users;
postgres> \q

========================================
Bower Setup
========================================
$ npm install -g bower
[Gemfile] + gem 'bower-rails'
$ bundle install
$ bundle exec rake -T bower

Create "Bowerfile" in root
+ asset 'bootstrap-sass-official' 

<note> http://bower.is/search

$ bower search bootstrap | head
$ bundle exec rake bower:install

[app/assets/stylesheets/application.css]
+ *= require 'bootstrap-sass-official'

=========================================
Devise View
=========================================

$ bundle exec rails generate devise:views

=========================================
PostgreSQL Email Constraint
=========================================

$ bundle exec rails g migration add-email-constraint-to-users
+
def up
	execute %{
		ALTER TABLE
			users 
		ADD CONSTRAINT 
			email_must_be_company_email
		CHECK ( email ~* '^[^@]+@example\\.com' )
	}  
  end

def down
	execute %{
		ALTER TABLE
			users 
		DROP CONSTRAINT
			email_must_be_company_email
	}
end

$ bundle exec rake db:migrate

<note> UPDATE users SET email = 'user2@example.com' WHERE id = 1;

$ bundle exec rails dbconsole

shine_development> INSERT INTO
				   	users (
				   		email,
				   		encrypted_password,
				   		created_at,
				   		updated_at
				   	)
				   VALUES (
				   	'foo@example.com',
				   	'$abcd',
				   	now(),
				   	now()
				   );

=========================================
PostgreSQL Schema Change
=========================================

[/config/application.rb]
+ config.active_record.schema_format = :sql

$ rm db/schema.rb
$ bundle exec rake db:migrate
$ RAILS_ENV=test bundle exec rake db:drop
$ RAILS_ENV=test bundle exec rake db:create

