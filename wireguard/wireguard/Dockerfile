FROM alpine:3

RUN apk add --no-cache wireguard-tools

COPY entrypoint.sh /
EXPOSE 51820/udp
ENTRYPOINT [ "/entrypoint.sh" ]