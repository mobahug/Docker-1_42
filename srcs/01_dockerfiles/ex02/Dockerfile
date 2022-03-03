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

# Create rails app
# ./create_rails_project.sh
#
# Build
# docker build -t ft-rails:on-build .
#
# Build on-build Dockerfile
# docker build -t ex02 -f ex02-Dockerfile ./helloworld
#
# Run
# docker run -dit --rm -p 3000:3000 ex02
#
# Test
# curl (docker-machine ip Char):3000
