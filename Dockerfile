# Build Image
FROM golang:alpine3.15 AS builder

RUN go install github.com/sberk42/fritzbox_exporter@latest \
    && mkdir /app \
    && mv /go/bin/fritzbox_exporter /app

WORKDIR /app

COPY entrypoint.sh metrics.json metrics-lua.json metrics-lua_cable.json /app/

# Runtime Image
FROM alpine:3.16.2 as runtime-image

ENV USERNAME username
ENV PASSWORD password
ENV GATEWAY_URL http://fritz.box:49000
ENV LISTEN_ADDRESS 0.0.0.0:9042
ENV GATEWAY_LORA_URL http://192.168.1.1

RUN mkdir /app \
    && addgroup -S -g 1000 fritzbox \
    && adduser -S -u 1000 -G fritzbox fritzbox \
    && chown -R fritzbox:fritzbox /app 

WORKDIR /app

COPY --chown=fritzbox:fritzbox --from=builder /app /app

RUN chmod +x /app/entrypoint.sh

EXPOSE 9042

ENTRYPOINT [ "/app/entrypoint.sh"  ]
