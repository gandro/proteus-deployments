FROM alpine:3

RUN apk add --no-cache ca-certificates transmission-cli transmission-daemon && \
    wget -O /tmp/flood-for-transmission.tar.gz \
        "https://github.com/johman10/flood-for-transmission/releases/download/latest/flood-for-transmission.tar.gz" && \
    tar xf /tmp/flood-for-transmission.tar.gz -C /opt

ENV TRANSMISSION_WEB_HOME=/opt/flood-for-transmission/

EXPOSE 9091 51413/tcp 51413/udp
VOLUME /config /downloads
USER transmission
ENTRYPOINT [ "/usr/bin/transmission-daemon" ]
CMD [ "-f", "-g", "/config", "-w", "/downloads"]