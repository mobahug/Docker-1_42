#!/usr/bin/env sh

docker run -it \
	--rm \
	--mount type=bind,source="$(pwd)",target=/opt/app \
	-w /opt/app \
	ruby:3.1.0 \
	/bin/bash -c "gem install rails && rails new helloworld"

sed -i '' "s|gem 'sqlite3'|&, '~> 1.3.6'|" helloworld/Gemfile
