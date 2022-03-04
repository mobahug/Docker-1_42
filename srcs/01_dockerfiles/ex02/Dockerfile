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

###############################
#
# Create rails app:
#
###############################

#docker run -it \
#	--rm \
#	--mount type=bind,source="$(pwd)",target=/opt/app \
#	-w /opt/app \
#	ruby:3.1.0 \
#	/bin/bash -c "gem install rails && rails new helloworld"
#
#sed -i '' "s|gem 'sqlite3'|&, '~> 1.3.6'|" helloworld/Gemfile


# gem 'sqlite3'|&, '~> 1.3.6' -	specifying gem dependencies
#								its important in order to work
#								properly ruby with the proper gem version

# ~>		-	ensures that your application will
#				safely work with future versions of a gem


# mount over volumes
# https://docs.docker.com/storage/bind-mounts/

# Bind mounts:	A bind mount is a file or folder stored anywhere
#				on the container host filesystem, mounted into a running container.

#				The main difference a bind mount has from a volume is
#				that since it can exist anywhere on the host filesystem,
#				processes outside of Docker can also modify it.

###############################
#
###############################



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
