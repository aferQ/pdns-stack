FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y libboost-dev libboost-filesystem-dev libboost-serialization-dev \
    libboost-system-dev libboost-thread-dev libboost-context-dev \
    libboost-test-dev libssl-dev g++ make pkg-config ragel python3 python3-venv \
    libluajit-5.1-dev build-essential autoconf automake libtool m4 git dnsutils curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*


# Install Rust (cargo)
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Verify cargo
#RUN cargo --version

# Clone latest pdns and submodules
RUN git clone --recursive https://github.com/PowerDNS/pdns.git /pdns

WORKDIR pdns/pdns/recursordist/

# Compile the recursor
RUN  autoreconf -vi && \
     ./configure && \
     make

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 53/udp 53/tcp 8081

ENTRYPOINT ["/entrypoint.sh"]
