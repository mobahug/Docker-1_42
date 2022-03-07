# FROM - requesting docker to pull the "latest" alpine image
# RUN - running the packagee manager to execute command
# ENTRYPOINT - specifying the command what run automataicly
# https://linuxhandbook.com/install-vim-docker/
# to build it use:
#					docker build -t <container_name> <folder_path>

FROM alpine:latest

RUN apk update \
	&& apk upgrade \
	&& apk add vim

ENTRYPOINT [ "vim" ]