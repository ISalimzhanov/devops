FROM python:3.8-alpine as builder

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN apk add --no-cache make build-base openssl-dev libffi-dev && python3 -m pip install poetry

WORKDIR /app

COPY pyproject.toml .
COPY poetry.lock .
COPY Makefile .

RUN python3 -m venv /venv && make install PYTHON=/venv/bin/python3

FROM python:3.8-alpine AS app

RUN apk add --no-cache libffi openssl

RUN adduser -D myuser && \
    mkdir /app && \
    mkdir /venv && \
    chown -R myuser /app && \
    chown myuser /venv
USER myuser

COPY --from=builder /venv /venv

COPY . /app/

WORKDIR /app

CMD ["/venv/bin/python", "run.py"]

EXPOSE 8080
