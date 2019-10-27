#!/bin/bash

containerId=$(cat .runningContainer)

if [ -z "$containerId" ]
then
      echo "\Container ID was not found in .runningContainer file locally.  Are you sure the container is running?"
else
      echo "Found container with id:$containerId"
      echo "Stopping container with id:$containerId"
      docker stop $containerId
      echo "" > .runningContainer
fi
