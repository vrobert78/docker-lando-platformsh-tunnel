FROM pjcdawkins/platformsh-cli:latest

RUN groupadd -r platform && \
    useradd --no-log-init -r -g platform platform && \
    mkdir -p /home/platform/.ssh && \
    echo "StrictHostKeyChecking no" > /home/platform/.ssh/config && \
    chown -R platform /home/platform/.ssh

USER platform

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
