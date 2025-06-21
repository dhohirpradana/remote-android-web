FROM emptysuns/scrcpy-web:v0.1
LABEL maintainer="IDNA"

RUN apt-get update && apt-get install -y curl gnupg \
    && curl -s https://install.zerotier.com | bash

RUN apt-get install -y python3 python3-pip \
    && pip3 install flask

COPY api.py /app/api.py

CMD ["sh", "-c", "zerotier-one & python3 /app/api.py"]