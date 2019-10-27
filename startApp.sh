#!/bin/bash

# set defaults for dev mode
environment="development"
port="4200"
command="docker run -d -v ${PWD}:/app -v /app/node_modules -p 4200:4200 --name app --rm app:dev"

# if set to production, alter variable and command
if [ "$1" == "-prod" ] 
then
  echo "Running in production mode"
  environment="production"
  port="80"
  command="docker run -d -p 80:80 --rm app:prod"
else
 echo "Running in development mode"
fi

# run the docker image and mount at ./app and remove container and volumes on container exit
echo "Running $command"
containerId=$($command)
echo "Started container with id:$containerId"

# store the container id locally to be able to stop it later
echo $containerId > .runningContainer
sleep 5
echo "App running on port $port"
