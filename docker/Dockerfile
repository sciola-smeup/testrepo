FROM nodered/node-red:3.1.0-18-minimal

# Installo pacchetti necessari per funzionamento
# TODO: Renderli dinamici
RUN npm i node-red-node-sqlite 
RUN npm i node-red-contrib-full-msg-json-schema-validation
RUN npm i node-red-contrib-fs
RUN npm i node-red-contrib-fs-ops
RUN npm i node-red-contrib-cron-plus
RUN npm i node-red-contrib-cpu
RUN npm i node-red-contrib-os
RUN npm i @objectif-lune/node-red-contrib-files-and-folders


# Usato per gestione download file di google Drive
USER root
RUN apk add wget

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN pip install gdown

USER 0
RUN mkdir -p /home/pi/Downloads/google-drive-upload/downloads
RUN mkdir -p /home/pi/Downloads/google-drive-upload/explodedZip

# Usato per spostare successivamente il totem.db e il kiosk.sh
RUN mkdir -p /home/pi/Immagini
RUN mkdir -p /home/pi/Video
RUN mkdir -p /home/pi/Documenti

EXPOSE 1880
WORKDIR /usr/src/node-red
