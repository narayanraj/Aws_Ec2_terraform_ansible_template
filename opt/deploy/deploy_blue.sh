#!/bin/bash
set -e

IMAGE=${DOCKER_REPO}:${GITHUB_SHA}
CONTAINER=flask_blue
PORT=5001

echo "Deploying BLUE container with image $IMAGE"

docker pull $IMAGE

docker stop $CONTAINER || true
docker rm $CONTAINER || true

docker run -d \
  --name $CONTAINER \
  -p ${PORT}:5000 \
  --env-file /opt/app/.env \
  $IMAGE

sleep 10

if docker ps | grep -q $CONTAINER; then
  echo "BLUE container running successfully"
else
  echo "Deployment failed"
  exit 1
fi
