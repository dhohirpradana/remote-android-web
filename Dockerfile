FROM emptysuns/scrcpy-web:v0.1

RUN apk add --no-cache \
    bash \
    ca-certificates \
    iproute2 \
    iptables \
    libstdc++ \
    libc6-compat \
    python3 \
    py3-pip

COPY zerotier-one /usr/local/bin/zerotier-one
RUN chmod +x /usr/local/bin/zerotier-one && \
    ln -sf /usr/local/bin/zerotier-one /usr/local/bin/zerotier-cli

COPY api.py /app/api.py
WORKDIR /app

RUN pip3 install flask
