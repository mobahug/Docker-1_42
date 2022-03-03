FROM ruby:3.1.0

RUN apt update -y &&\
	apt install -y nodejs &&\
	rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

ONBUILD COPY . /opt/app
ONBUILD RUN gem install bundler
ONBUILD RUN bundle install
ONBUILD RUN rails db:create
ONBUILD RUN rails db:migrate

# nodejs -	required to manage the JavaScript used by a Rails application

# gem install bundler -	Bundler makes sure that Ruby applications always use
#						the exact gems and versions that you need while
#						keeping a consistent environment and gem dependencies satisfied

# bundle install -	This ensures that other developers on your Ruby application
#					run the same third-party code on every machine.

# rails db:create -	creating rails database

# rails db:migrate -	migrating the database
#						tool for changing an application's database schema.
#						Instead of managing SQL scripts, you define database changes
#						in a domain-specific language (DSL)

# What are gems?

# Gems in Rails are libraries that allow
# any Ruby on Rails developer to add functionalities
# without writing code.



# Create rails app:
#
# ./create_rails_app.sh


# Build:
#
# docker build -t ft-rails:on-build .


# Build on-build Dockerfile:
#
# docker build -t ex02 -f ex02-Dockerfile ./helloworld


# Run
#
# docker run -dit --rm -p 3000:3000 ex02


# Test
#
# curl (docker-machine ip Char):3000
# or open Docker app
