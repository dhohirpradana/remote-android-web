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

COPY api.py /app/api.py
WORKDIR /ws-scrcpy

RUN pip3 install flask
ENTRYPOINT ["/bin/sh", "-c", "npm start & python3 /app/api.py & wait"]