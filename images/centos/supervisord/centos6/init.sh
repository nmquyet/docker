#!/bin/bash

/bin/sh -c "$@"

. /pythonenv/supervisord/bin/activate

supervisord -c /etc/supervisord.conf
