FROM node:16-buster

RUN apt-get update && apt-get install -y libasound2 && \
  rm -rf /var/lib/apt/lists/*

RUN wget --no-verbose https://plexamp.plex.tv/headless/Plexamp-Linux-headless-v4.6.2.tar.bz2 && \
  tar xjf Plexamp-Linux-headless-v4.6.2.tar.bz2 -C /root && \

ENV LD_LIBRARY_PATH /root/plexamp/resources/helpers/linux-arm
ENV LD_LIBRARY_PATH /root/plexamp/server/node_modules/treble/build/Release/
ENV PLUGIN_PATH /root/plexamp/server/node_modules/treble/build/Release/

EXPOSE 20000
ENTRYPOINT ["node", "/root/plexamp/server/server.prod.js"]