FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y pdns-server pdns-backend-mysql curl default-mysql-client  dnsutils  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY pdns.conf /etc/powerdns/pdns.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 53/udp 53/tcp 8081

ENTRYPOINT ["/entrypoint.sh"]
