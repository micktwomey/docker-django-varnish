#!/bin/bash

sed -i.original \
    -e "s~::BACKEND_PORT_8000_TCP_ADDR::~${BACKEND_PORT_8000_TCP_ADDR}~g" \
    -e "s~::BACKEND_PORT_8000_TCP_PORT::~${BACKEND_PORT_8000_TCP_PORT}~g" \
    /varnish/config/default.vcl
exec /usr/sbin/varnishd -F -f /varnish/config/default.vcl -a 0.0.0.0:6081 "$@"
