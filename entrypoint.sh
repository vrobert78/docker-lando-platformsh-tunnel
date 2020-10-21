#!/bin/bash
set -e

# Grab relationship port and host to use in SSH command.
RELATIONSHIP_PORT=$(platform relationships -p $PLATFORM_PROJECT -e $PLATFORM_ENVIRONMENT -A $PLATFORM_APP -P ${PLATFORM_RELATIONSHIP_NAME}.0.port)
RELATIONSHIP_HOST=$(platform relationships -p $PLATFORM_PROJECT -e $PLATFORM_ENVIRONMENT -A $PLATFORM_APP -P ${PLATFORM_RELATIONSHIP_NAME}.0.host)

echo "Don't forget to expose port $RELATIONSHIP_PORT in your docker-compose file!"

# Open SSH tunnel in foreground and print detailed logs.
ssh -i $PATHSSHKEY -n -N -L \
  0.0.0.0:$RELATIONSHIP_PORT:$RELATIONSHIP_HOST:$RELATIONSHIP_PORT \
  $(platform ssh -p $PLATFORM_PROJECT -e $PLATFORM_ENVIRONMENT -A $PLATFORM_APP --pipe) \
  -o ServerAliveInterval=180 \
  -o LogLevel=VERBOSE
