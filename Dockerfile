# nBio docker build

FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y && apt install -y \
    libexpat1-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libxt-dev \
    xorg-dev \
    build-essential \
    libharfbuzz-dev \
    cmake \
    bash \
    unzip

WORKDIR /tmp

COPY . .

RUN ls -la

WORKDIR topas_3_9/debian9

RUN ls -la

RUN unzip Geant4Headers.zip

RUN ls -la

RUN ls -la ../../extensions

RUN cmake -DTOPAS_EXTENSIONS_DIR=../../extensions && \
    cmake --build .

#ENTRYPOINT ["get_geant4_data.sh"]
ENTRYPOINT ["ls", "-la"]

CMD ["bin/topas", "examples/Basic/BatchJobShared.txt"]