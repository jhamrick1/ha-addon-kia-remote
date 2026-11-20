ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apk add --no-cache git gcc musl-dev libffi-dev openssl-dev python3-dev

WORKDIR /opt
RUN git clone --depth 1 https://github.com/kobkob88/kia-remote-public.git app \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir --upgrade pip \
    && /opt/venv/bin/pip install --no-cache-dir -r app/requirements.txt \
    && sed -i 's/^HOST = "127.0.0.1".*/HOST = "0.0.0.0"/' app/server/__main__.py

COPY run.sh /
RUN chmod a+x /run.sh
CMD ["/run.sh"]
