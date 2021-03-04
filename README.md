About
------------

Lightweight React Base is a pre-configured dockerization of ReactJS, Typescript, Parcel, PostCSS, ESLint, and Tailwind. With docker-compose installed, you can very quickly and easily use this distribution to generate the foundation of your web app / website.


Usage
------------

**Using docker-compose**

Create a docker-compose.yml file in an empty folder. Structure your compose file like the following:

```yaml
version: '3'
services:
  my-service-name:
    image: illubyte8studios/lightweight-react-base:latest
    restart: "no"
    volumes:
      - ./app:/srv/app/src
    ports:
      - '4440:4440'
```

**Volumes**

Internally, the project files are stored in the container's `/srv/app/src` directory. You can map this to whatever you'd like on your host machine, i.e.

```yml
volumes:
  - ./<YOUR_LOCAL_DIRECTORY>:/srv/app/src
```

**ports**

By default, we expose port `4440` upon creation of the docker container. You can map this to whatever you'd like on your host machine, i.e.

```yml
ports:
  - '<YOUR_PORT_HERE>:4440'
```

**Start Command**

When your docker contain is spun up using the information above, by default it will run a `yarn start` upon completion. This command will execute the following:

```bash
parcel serve ./src/index.html -p 4440 --no-hmr
```
This will start Parcel's local development server on port `4440`, with Hot Module Reloading disabled. As a consequence of utilizing a beta version of Parcel v2, we can run into some issues with HMR enabled. If you'd like to enable it anyway, you may add the following line to your `docker-compose.yml`.

```yml
command: 'yarn start:hmr'
```

**Building For Production**

> Documentation in progress

**Typescript**

> Documentation in progress

**ESLint**

> Documentation in progress

**PostCSS & Tailwindcss**

> Documentation in progress


Requirements
------------

  - Docker / Docker-compose
