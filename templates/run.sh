#!/bin/bash
docker run -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ${app_context}:${app_context} -w ${app_context} \
    ${compose_image}:${compose_version} -f ${app_context}/docker-compose.yaml up -d