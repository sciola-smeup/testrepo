#!/bin/bash
source ./var.sh

## Creo volume persistente in cui copierò il flusso
echo -e "\nCreate volume \"${CONTAINER_VOLUME}\"..."
docker volume create ${CONTAINER_VOLUME}

## Buildo immagine
echo -e "\nBuilding container with image \"${CONTAINER_IMAGE}\"..."
docker build . -t ${CONTAINER_IMAGE}

exit 0