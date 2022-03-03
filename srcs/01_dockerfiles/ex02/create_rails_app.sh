#!/usr/bin/env sh

docker run -it \
	--rm \
	--mount type=bind,source="$(pwd)",target=/opt/app \
	-w /opt/app \
	ruby:3.1.0 \
	/bin/bash -c "gem install rails && rails new helloworld"

sed -i '' "s|gem 'sqlite3'|&, '~> 1.3.6'|" helloworld/Gemfile


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