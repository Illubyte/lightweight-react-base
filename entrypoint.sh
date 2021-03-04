#!/bin/sh
set -ea

# Check if package.json file exists in source volume, if not try copying
# over boilerplate contents.
if [ ! -f "package.json" ]; then

  echo "package.json not found at /srv/app/src"

  if [ -z "$(ls -A ./)" ]; then

    echo "Directory is empty, mirroring boilerplate."
    cp -r /srv/app/boilerplate/. /srv/app/src

  else

    echo "Bind mount directory must be empty in order to initialize."
    echo "Please remove contents and then re-run docker / docker-compose."
    echo "Terminating Process"
    exit 0

  fi

fi

if [ ! -d "node_modules" ] || [ ! "$(ls -qAL node_modules 2>/dev/null)" ]; then
  echo "Node modules not installed. Installing, this may take a while, please wait..."
  yarn install
fi

echo "Starting app..."

exec "$@"