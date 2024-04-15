FROM ubuntu:23.04

# Install espressif-sdk and deps
RUN apt update && apt install -y \
    git \
    cmake \
    python3 \
    python3-pip \
    python3-venv \
    libusb-1.0-0-dev

# Clone repo and single depth to save space
RUN git clone https://github.com/espressif/esp-idf --depth=1 /opt/esp-idf

WORKDIR /opt/esp-idf

# Fudge some git settings because security
RUN git config --global --add safe.directory "*"

# Install the IDF and prepare
RUN bash -c /opt/esp-idf/install.sh
