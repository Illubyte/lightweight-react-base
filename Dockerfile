# Latest Long Term Support version of node
FROM node:lts

RUN apt-get update -y && apt-get autoremove -y

# Create app directory
RUN mkdir -p /srv/app/src && chown 1000:1000 -R /srv/app/src
RUN mkdir -p /srv/app/boilerplate && chown 1000:1000 -R /srv/app/boilerplate

# Create app directory
WORKDIR /srv/app/src

VOLUME /srv/app/src

# Copy all source files to container
COPY ./base /srv/app/boilerplate

# Exposing port for development server
EXPOSE 4440

COPY ./entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD [ "yarn", "start" ]
