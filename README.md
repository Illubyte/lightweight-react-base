About
------------

Lightweight React Base is a pre-configured dockerization of ReactJS, Typescript, Parcel, PostCSS, ESLint, and Tailwind. With docker-compose installed, you can very quickly and easily use this distribution to generate the foundation of your web app / website.

> **NOTE:** Version 1.0.0 of this package utilizes a beta version of Parcel v2. This should not cause any issues with built files, however, you may experience occasional errors during the build process, or while running the development server. Use at your own risk.


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

```console
parcel serve ./src/index.html -p 4440 --no-hmr
```
This will start Parcel's local development server on port `4440`, with Hot Module Reloading disabled. As a consequence of utilizing a beta version of Parcel v2, we can run into some issues with HMR enabled. If you'd like to enable it anyway, you may add the following line to your `docker-compose.yml`.

```yml
command: 'yarn start:hmr'
```

**Building For Production**

Adding the following command to your docker-compose will build your production files upon composition. After building, the container will stop.

```yml
command: 'yarn build'
```

**Typescript**

Parcel will compile all typescript, however, it does not type-check. To manually run type checking, the following command is supplied:

```console
yarn typecheck
```

As with all of the available commands, if your local environment is similar to the environment in docker (Node LTS), you may run this command from the project folder on your host machine.

In the future I may add a build process that does type checking before-hand, but no plans are currently made.

**ESLint**

A default ESLint confiuration is included that plays nicely with javascript, typescript, react, and JSON. You can add to, remove, or otherwise modify this at your discretion.

**PostCSS & Tailwindcss**

This project is set up with a bare-bones implementation of PostCSS and Tailwind. Parcel will automatically compile these based on the included configuration. The resolved entrypoints are based on the files imported into our html/tsx files. Currently, the `index.tsx` file includes the following two lines:

```javascript
import './styles/tailwind-base/styles.css'
import './styles/index.sass'
```

Thus, Parcel resolves the css in that order. It will first compile the Tailwind base, then compile the SASS. Once everything is compiled down to CSS, it will do the tree-shaking based on the files specified in the `purge` array in `tailwind.config.css`.

```
purge: [
    './src/**/*.html',
    './src/**/*.tsx',
    './src/**/*.jsx'
  ],
```

Note that this is a function of Tailwind. You can do tree-shaking with PostCSS alone, however that is not included pre-configured in this package. As such, the only code that will be narrowed down is the Tailwind base code, and any code that is specified as a [layer of Tailwind](https://tailwindcss.com/docs/optimizing-for-production#removing-all-unused-styles).

**Note**

The entry to your app is defaulted to `./src/index.html`. If you wish to change this, you can modify the commands in your `package.json` file.

Requirements
------------

  - Docker / Docker-compose