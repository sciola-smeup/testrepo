#!/bin/bash
source var.sh

## Se container non attivo esco
docker ps | grep ${CONTAINER_NAME} > /dev/null
if [ $? -ne 0 ]
then
    echo "Errore! Container non attivo!"
    exit -1
fi

## Creo file di bakup prima di fare copia locale
echo -e "\nCreate flows.json backup in host machine... "
cp ${PATHN}/node-red/flows.json ${PATHN}/node-red/flows.json.backup

## Copio flusso da container in locale
echo -e "\nCopy flows.json from container "\${CONTAINER_NAME}\"" to host..."
docker cp ${CONTAINER_NAME}:/data/flows.json ${PATHN}/node-red/flows.json

## Stoppo container
echo -e "\nStopping container \"${CONTAINER_NAME}\"..."
docker stop ${CONTAINER_NAME}

exit 0