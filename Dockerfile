FROM alpine:3.18.2

COPY COMMODORE-BASIC_* /tmp/
RUN apk add git make gcc musl-dev && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/mist64/cbmbasic -b master && \
    cd cbmbasic && \
    make && \
    cp cbmbasic /usr/local/bin && \
    cd / && \
    apk del git make gcc && \
    rm -rf /opt/cbmbasic
