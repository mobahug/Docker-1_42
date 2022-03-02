# FROM - requesting docker to pull the "latest" alpine image
# RUN - running the packagee manager to execute command
# ENTRYPOINT - specifying the command what run automataicly
# https://linuxhandbook.com/install-vim-docker/


FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add vim

ENTRYPOINT [ "vim" ]