FROM debian

EXPOSE 30033/tcp
EXPOSE 9987/udp
EXPOSE 10011/tcp

# To start a TeamSpeak server, accept the license agreement:

ENV TS3SERVER_LICENSE=accept

# installing the necesarry packages, removig compressed bz2 file after extraction
# with curl we get the teamspeak service package zip file
# with tar we open it and remove the zip file, beacuse we need only the
# file itself and keeping clean the system
# curk	-k (checking is the server secured, having proper SSL certificate)
#		-L (location)
#		-J (make sure if there is already a same filename not be overwritten)
#		-O (only the file path will be used for naming, the path(html name) will be cuted off)

# tar	-x (extract)
#		-v (will extract with the same name what is the zip file)
#		-f (file specifier)

# autoremove gonna remove all the unnecesarry dependecies which came with installations
# and finally; we cleans local files what left from /var/cache/

RUN apt-get update && \
	apt-get install -y curl tar bzip2 && \
	rm -rf /var/lib/apt/lists/* && \
	curl -kLJO https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2 && \
	tar -xvf teamspeak3-server_linux_amd64-3.13.6.tar.bz2 && \
	rm -rf teamspeak3-server_linux_amd64-3.13.6.tar.bz2 && \
	apt-get autoremove -y && \
	apt-get clean

WORKDIR /teamspeak3-server_linux_amd64

ENTRYPOINT [ "./ts3server" ]