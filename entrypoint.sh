#!/bin/bash
set -e

# Grab relationship port and host to use in SSH command.
RELATIONSHIP_HOST=$(platform relationships -p $PLATFORM_PROJECT -e $PLATFORM_ENVIRONMENT -A $PLATFORM_APP -P ${PLATFORM_RELATIONSHIP_NAME}.0.host)

echo "Don't forget to expose port $RELATIONSHIP_PORT in your docker-compose file!"

# Open SSH tunnel in foreground
platform tunnel:single -p $PLATFORM_PROJECT -e $PLATFORM_ENVIRONMENT -A $PLATFORM_APP -r ${PLATFORM_RELATIONSHIP_NAME} -y
