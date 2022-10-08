FROM alpine

MAINTAINER "luobo"
COPY elmmb /etc/elm/elmmb
COPY Config.json /etc/elm/Config.json
RUN chmod 777 /etc/elm/elmmb && \
    mkdir -p /lib64 && \
    apk add --no-cache libstdc++ && \
    apk add --no-cache libgcc && \
    apk add --no-cache libc6-compat && \
    apk add --no-cache gcompat

#ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /etc/elm

EXPOSE 3000

ENTRYPOINT ["./elmmb"]
