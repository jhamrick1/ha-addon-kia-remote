ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apk add --no-cache git gcc musl-dev libffi-dev openssl-dev python3-dev

WORKDIR /opt
RUN git clone https://github.com/jhamrick1/kia-remote-usa.git app \
    && cd app && git checkout e3a606225bdf7c96134d73923717097432390134 && cd .. \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir --upgrade pip \
    && /opt/venv/bin/pip install --no-cache-dir -r app/requirements.txt \
    && sed -i 's/^HOST = "127.0.0.1".*/HOST = "0.0.0.0"/' app/server/__main__.py \
    && sed -i 's/return client_host not in (None, "127.0.0.1", "::1", "localhost")/return False  # tailnet deployment: trust non-CF clients; device approval still gates/' app/server/access.py

COPY run.sh /
RUN chmod a+x /run.sh
CMD ["/run.sh"]
