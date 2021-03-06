# Platform.sh Tunnel for Lando

## Introduction

<img src="https://platform.sh/logos/redesign/Platformsh_icon_black.svg" width="20" height="20"> [Platform.sh](https://platform.sh) is a PaaS that lets you host your website in an easy and modern way.\
If you didn't already tested it, go on ! You'll adore it!

<img src="https://docs.lando.dev/images/hero-pink.png" width="20" height="20"> [Lando](https://docs.lando.dev/) is an excellent local dev tool.\
In the last versions of Lando, the tool is now [compatible](https://docs.lando.dev/config/platformsh.html) with Platform.sh.

You can use your Platform.sh' config files in Lando, without the need to modify them.

## Why using a tunnel with Lando

Using Lando gives you a local infrastructure to run your project. Usually, it's fine and sufficient.

But it may arrive that you need to access data from your Platform.sh hosted version, from your production for instance.\
In that case, you'll need to set up a tunnel between your local environment and your Platform.sh production env.

This docker image has been done for this purpose.

## How to use it

Add in your lando config file (`.lando.yml` or `.lando.upstream.yml`) a new service:

```yaml
services:
  tunnel:
    type: compose
    app_mount: false
    services:
      image: vrobert78/lando-platformsh-tunnel
      command: ./entrypoint.sh
      environment:
        PLATFORM_PROJECT: your_project_id
        PLATFORM_ENVIRONMENT: your_environment
        PLATFORM_APP: name_of_your_platformsh_app
        PLATFORM_RELATIONSHIP_NAME: name_of_the_relationship_you_want_to_connect
        PLATFORMSH_CLI_TOKEN: your_platformsh_api_token
        RELATIONSHIP_PORT: exposed_port
        LANDO_NEEDS_EXEC: DOEEET
      ports:
        - 'exposed_port'
```

Rebuild lando: `lando rebuild`

Then you can now connect to your distant relationship using his name `tunnel`

You can verify if everything is OK: `lando logs -s tunnel`