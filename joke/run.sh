#!/bin/bash

# chmod +x run.sh

## -d -- detached (runs in bg)
# docker run -d -p 3000:3000 \
## mounts data into container to prevent loosing the data after container removing
## source="$(pwd)" dir to exec from
#   --mount type=bind,source="$(pwd)"/data/,target=/app/data/ \
#   --rm # when stop the conteiner - auto remove it 
## give container the name
#  --name sveltekit-joke \
## what image to use
#  joke


# sudo docker run -d -p 3000:3000 --name sveltekit-joke joke

# without -d it will stop on this line and wait till Ctrl + C (termination of process)
sudo docker run --rm -d -p 3000:3000 --name sveltekit-joke joke

# -a -- show the containers, including those that are stopped
sudo docker ps -a

# sudo docker stop sveltekit-joke
# sudo docker rm sveltekit-joke

# forcefully stop and remove the container in a single command, you can use
# sudo docker rm -f sveltekit-joke


# Wait for a few seconds to ensure the container has started
sleep 3

# Open the URL in the default web browser
xdg-open http://localhost:3000/joke

# Linux: xdg-open http://localhost:3000
# macOS: open http://localhost:3000
# Windows: start http://localhost:3000
