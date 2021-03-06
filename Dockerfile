FROM pjcdawkins/platformsh-cli:latest

RUN mkdir -p /root/.ssh && \
    echo "StrictHostKeyChecking no" > /root/.ssh/config && \
    echo "GatewayPorts yes" >> /root/.ssh/config

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
