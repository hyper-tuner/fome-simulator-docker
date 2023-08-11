FROM ubuntu:latest

WORKDIR /sim

COPY add-ubuntu-latest-apt-mirrors.sh .

RUN ./add-ubuntu-latest-apt-mirrors.sh \
  && apt update \
  && apt upgrade -y \
  && apt install -y \
    gcc \
    gcc-multilib \
    g++-multilib \
    netbase \
  && rm -rf /var/lib/apt/lists/*

COPY bundle/fome_simulator ./fome_simulator
RUN chmod +x fome_simulator

EXPOSE 29001
EXPOSE 29002

CMD ["/sim/fome_simulator"]
