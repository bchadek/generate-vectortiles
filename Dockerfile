FROM node:6.1.0
MAINTAINER Lukas Martinelli <me@lukasmartinelli.ch>

WORKDIR /usr/src/app
RUN npm install -g \
          tl \
          mapnik@3.7.2 \
          @mapbox/mbtiles \
          @mapbox/tilelive \
          tilelive-tmsource \
          @mapbox/tilelive-vector \
          @mapbox/tilelive-bridge \
          @mapbox/tilelive-mapnik

VOLUME /tm2source /export
ENV SOURCE_PROJECT_DIR=/tm2source EXPORT_DIR=/export TILELIVE_BIN=tl

COPY . /usr/src/app/
CMD ["/usr/src/app/export-local.sh"]
