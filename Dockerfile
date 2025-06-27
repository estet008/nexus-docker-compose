FROM ubuntu:24.04

RUN apt update && apt install -y \
    curl unzip ca-certificates \
    libssl-dev libcurl4-openssl-dev \
    tzdata

RUN useradd -ms /bin/bash prover

USER prover
WORKDIR /home/prover
ENV HOME=/home/prover

RUN curl -sSf https://cli.nexus.xyz/ -o install.sh \
 && chmod +x install.sh \
 && NONINTERACTIVE=1 ./install.sh \
 || echo "⚠️ Nexus CLI не встановлено (можливо, мережа недоступна або CLI тимчасово недоступний)"

COPY --chown=prover:prover entrypoint.sh /home/prover/entrypoint.sh
RUN chmod +x /home/prover/entrypoint.sh

ENTRYPOINT ["/home/prover/entrypoint.sh"]
