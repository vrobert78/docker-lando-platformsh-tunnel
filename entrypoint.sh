#!/bin/bash
set -e

if [[ -z $RELATIONSHIP_PORT ]];
then
  echo "RELATIONSHIP_PORT is not set, use the default value: 30000"
  RELATIONSHIP_PORT="30000"
fi

if [[ -z $PLATFORMSH_CLI_TOKEN ]];
then
  echo "PLATFORMSH_CLI_TOKEN environment variable is missing."
  exit 1
fi

if [[ -z $PLATFORM_PROJECT ]];
then
  echo "PLATFORM_PROJECT environment variable is missing."
  exit 1
fi

if [[ -z $PLATFORM_ENVIRONMENT ]];
then
  echo "PLATFORM_ENVIRONMENT environment variable is missing."
  exit 1
fi

if [[ -z $PLATFORM_APP ]];
then
  echo "PLATFORM_APP environment variable is missing."
  exit 1
fi

if [[ -z $PLATFORM_RELATIONSHIP_NAME ]];
then
  echo "PLATFORM_RELATIONSHIP_NAME environment variable is missing."
  exit 1
fi



echo "Don't forget to expose port $RELATIONSHIP_PORT in your .lando.yml file!"

# Open SSH tunnel in foreground
platform tunnel:single --project=$PLATFORM_PROJECT --environment=$PLATFORM_ENVIRONMENT --app=$PLATFORM_APP --relationship=${PLATFORM_RELATIONSHIP_NAME} --port $RELATIONSHIP_PORT -y
