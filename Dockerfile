FROM node:9
MAINTAINER Lukas Martinelli <me@lukasmartinelli.ch>

WORKDIR /usr/src/app
RUN npm install -g \
          tl@0.10.2 \
          mapnik@4.0.0 \
          @mapbox/mbtiles@mbtiles@0.10.0 \
          @mapbox/tilelive@6.0.0 \
          tilelive-tmsource@0.8.1 \
          @mapbox/tilelive-vector@4.0.0 \
          @mapbox/tilelive-bridge@3.0.0 \
          tilelive-mapnik@0.6.18

VOLUME /tm2source /export
ENV SOURCE_PROJECT_DIR=/tm2source EXPORT_DIR=/export TILELIVE_BIN=tl

COPY . /usr/src/app/
CMD ["/usr/src/app/export-local.sh"]
