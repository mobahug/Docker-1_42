#FROM ubuntu
#
#RUN apt-get update && apt-get upgrade \
#	&& apt-get -y install \
#	wget \
#	openssh-server \
#	ca-certificates \
#	postfix
#
#RUN wget \
#	https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh \
#	&& chmod 777 ./script.deb.sh && ./script.deb.sh
#RUN apt-get update && apt-get install tzdata gitlab-ce
#
#RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#
#EXPOSE 443
#EXPOSE 80
#EXPOSE 22
#
#ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && sleep 2 && gitlab-ctl reconfigure && tail -f /dev/null

# Script to install gitlab inside the container
#
# https://packages.gitlab.com/gitlab/gitlab-ce/install

# docker build -t my-gitlab .

# docker run -it -p 8080:80 -p 8022:22 -p 8443:443 --privileged my-gitlab


FROM ubuntu:focal

RUN apt-get update -y && \
	apt-get upgrade -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	curl \
	openssh-server \
	ca-certificates \
	postfix && \
	mkdir -p /etc/gitlab/trusted-certs && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/CN=localhost' -keyout /etc/gitlab/trusted-certs/localhost.key -out /etc/gitlab/trusted-certs/localhost.crt && \
	curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash && \
	apt-get install -y gitlab-ce && \
	rm -rf /var/lib/apt/lists/* && \
	echo "external_url \"https://localhost\"" >> /etc/gitlab/gitlab.rb && \
	echo "nginx['ssl_certificate'] = \"/etc/gitlab/trusted-certs/localhost.crt\"" >> /etc/gitlab/gitlab.rb && \
	echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/trusted-certs/localhost.key\"" >> /etc/gitlab/gitlab.rb && \
	echo "gitlab_rails['gitlab_shell_ssh_port'] = 4242" >> /etc/gitlab/gitlab.rb

EXPOSE 22 443 80

CMD (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && service ssh restart && gitlab-ctl tail

# ubuntu:focal		lattest version of ubuntu version

# DEBIAN_FRONTEND=noninteractive -	the system will install everything by default
#									won't ask questions from the user

###############################################
###############################################
# Build:
# docker build -t ghorvath/gitlab .
# Run:
# docker run -it --rm -p 80:80 -p 4242:22 -p 443:443 --privileged -e GITLAB_ROOT_EMAIL="gaborulenius@gmail.com" -e GITLAB_ROOT_PASSWORD="12345678" ghorvath/gitlab

# Test:
# 1. Register user "ghorvath"
# 2. Log in as root and go to admin panel to approve the user
# 3. Log in as ghorvath, create empty repo called "test", and add ssh key in user preferences.
# 4. Disable ssl authentication to avoid error message about self signed certificate:
#        git config --global http.sslVerify false
# 5. Clone the test repo with ssh and https addresses:
#         git clone ssh://git@localhost:4242/ghorvath/test.git ssh_test
#         git clone https://localhost/ghorvath/test.git https_test
# For HTTPS:
# GIT_SSL_NO_VERIFY=true git clone --recursive https://localhost/root/test.git
