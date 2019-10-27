#!/bin/bash

# build and tag the docker image
echo "building docker app with tag exampe:dev"
docker build -t example:dev .

# run the docker image and mount at ./app and remove container and volumes on container exit
echo "Starting angular app within Docker container."
containerId=$(docker run -d -v ${PWD}:/app -v /app/node_modules -p 4201:4200 --name app --rm example:dev)
echo "Started container with id:$containerId"

# store the container id locally to be able to stop it later
echo $containerId > .runningContainer
sleep 5
echo "Check http://localhost:4201"
