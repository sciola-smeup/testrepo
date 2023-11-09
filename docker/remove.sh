#!/bin/bash
source ./var.sh


## Stoppo container
echo -e "\nStopping container \"${CONTAINER_NAME}\"..."
docker ps | grep ${CONTAINER_NAME} > /dev/null
if [ $? -eq 0 ]
then
    docker stop ${CONTAINER_NAME}
else
    echo -e "Stop fallito! Container \"${CONTAINER_NAME}\" non attivo!"
fi


## Rimuovo container
echo -e "\nDeleting container \"${CONTAINER_NAME}\"..."
docker ps -a | grep ${CONTAINER_NAME} > /dev/null
if [ $? -eq 0 ]
then
    docker rm ${CONTAINER_NAME}
else
    echo -e "Rimozione fallita! Container \"${CONTAINER_NAME}\" non trovato!"
fi


## Rimuovo volume collegato
echo -e "\nDeleting volume \"${CONTAINER_VOLUME}\"..."
docker volume list | grep ${CONTAINER_VOLUME} > /dev/null
if [ $? -eq 0 ]
then
    docker volume rm ${CONTAINER_VOLUME}
else
    echo -e "Rimozione fallita! Volume ${CONTAINER_VOLUME} non trovato!"
fi

## Rimuovo immagine
echo -e "\nDeleting image \"${CONTAINER_IMAGE}\"..."
docker image ls -a | grep ${CONTAINER_IMAGE} > /dev/null
if [ $? -eq 0 ]
then
    docker image rm ${CONTAINER_IMAGE}
else
    echo -e "Rimozione fallita! Immagine ${CONTAINER_IMAGE} non trovata!"
fi

exit 0