FROM debian:sid-slim

ARG PLATFORM=linux_x86_64
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app
COPY entrypoint.sh .
RUN apt-get update && \
    apt-get install -y \
      wget && \
    apt-get clean && \
    rm -rf \
      /config/* \
      /tmp/* \
      /var/lib/apt/lists/* \
      /var/tmp/* && \
    wget -O "pawns-cli" "https://download.iproyal.com/pawns-cli/latest/${PLATFORM}/pawns-cli" && \
    chmod +x "pawns-cli"

ENTRYPOINT [ "bash", "-c", "./entrypoint.sh" ]
