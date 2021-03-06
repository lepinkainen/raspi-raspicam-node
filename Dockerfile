FROM resin/raspberrypi-node:latest

# Use apt-get to install any dependencies
RUN apt-get update && apt-get dist-upgrade && apt-get install -yq \
    python \
    libraspberrypi-bin \
    mosquitto-clients \
    dropbear \
    supervisor \
    i2c-tools \
    ibi2c-dev \
    python-smbus \
    cowsay && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Configuration for supervisord
COPY supervisord.conf /usr/local/etc/supervisord.conf

# Our app will reside here
WORKDIR /app

# package.json is copied separately to enable better docker build caching
COPY package.json /app/package.json
# Install node dependencies from package.json
RUN DEBIAN_FRONTEND=noninteractive JOBS=MAX npm install --unsafe-perm --loglevel error

# copy all files to /app
COPY . /app

# start the app
CMD ["/app/start.sh"]
