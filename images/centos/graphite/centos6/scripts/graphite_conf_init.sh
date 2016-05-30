#!/bin/bash

expand() {
    echo "Expanding config file: $1"
    local template="$(cat $1)"
    eval "echo \"$template\"" > "$1"
}

CARBON_CONF_FILE="/opt/graphite/conf/carbon.conf"
expand "$CARBON_CONF_FILE"

/usr/bin/supervisord -c /etc/supervisord.conf
