#!/bin/bash
source var.sh

## Start del container 
echo -e "\nStarting docker container \"${CONTAINER_NAME}\" on port \"${CONTAINER_PORT_EXT}\"..."

docker ps | grep ${CONTAINER_NAME} > /dev/null
## Se container già attivo
if [ $? -eq 0 ]
then
    echo "Error! Container già attivo!"
    exit -1
else
    docker ps -a | grep ${CONTAINER_NAME} > /dev/null
    ## Se container già creato
    if [ $? -eq 0 ]
    then
        docker start ${CONTAINER_NAME}
    else
        ## Se container non esiste
        docker run -d -p ${CONTAINER_PORT_EXT}:${CONTAINER_PORT_INT} \
            -v ${CONTAINER_VOLUME}:/data \
            --name ${CONTAINER_NAME} \
            ${CONTAINER_IMAGE}
    fi
fi

## Copio database e kiosk locale nel container
echo -e "\nCopying totem.db and kiosk.sh on container \"${CONTAINER_NAME}\"..."
docker cp ${PATHN}/totem.db ${CONTAINER_NAME}:/home/pi/totem.db
docker cp ${PATHN}/kiosk.sh ${CONTAINER_NAME}:/home/pi/kiosk.sh


## Copio flusso locale nel container
echo -e "\nCopying flows.json on container \"${CONTAINER_NAME}\"..."
docker cp ${PATHN}/node-red/flows.json ${CONTAINER_NAME}:/data/flows.json

exit 0