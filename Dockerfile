FROM dockerfile/nodejs

MAINTAINER  Christopher Lyth <cjlyth@gmail.com>

RUN npm config set python /usr/bin/python2 -g

RUN	apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
	build-essential \
	libgnome-keyring-dev \
	--no-install-recommends

ADD build-atom.sh /usr/local/bin/build-atom
RUN chmod 755 /usr/local/bin/build-atom

VOLUME ["/data"]
WORKDIR /data

CMD ["build-atom"]
ENTRYPOINT ["/usr/bin/env"]
