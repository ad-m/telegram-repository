FROM debian
RUN apt-get update \
&& apt-get install -y --no-install-recommends dpkg-dev dpkg-sig apt-utils software-properties-common curl \
&& rm -rf /var/lib/apt/lists/*
WORKDIR /src