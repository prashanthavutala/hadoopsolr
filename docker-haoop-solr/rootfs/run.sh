#!/bin/bash
. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

USER=solr
SOLR_LOGS_DIR=/opt/bitnami/solr/logs
#START_COMMAND="/opt/bitnami/solr/bin/solr -p ${SOLR_PORT_NUMBER} -d /opt/bitnami/solr/server && tail -f ${SOLR_LOGS_DIR}/solr.log"
START_COMMAND="/opt/bitnami/solr/bin/solr -p ${SOLR_PORT_NUMBER} -d /opt/bitnami/solr/server"

# If container is started as `root` user
if [ $EUID -eq 0 ]; then
    exec gosu ${USER} bash -c "${START_COMMAND}"
else
    exec bash -c "${START_COMMAND}"
fi