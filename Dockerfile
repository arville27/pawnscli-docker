FROM debian:sid-slim

ARG PLATFORM linux_x86_64

WORKDIR /app
RUN wget -O "pawns-cli" "https://download.iproyal.com/pawns-cli/latest/${PLATFORM}/pawns-cli" && \
    chmod +x "pawns-cli"

ENTRYPOINT [ "bash", "-c", "./entrypoint.sh" ]