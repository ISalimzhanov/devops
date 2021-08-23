FROM python:3.9-slim-buster AS builder

WORKDIR /app

COPY pyproject.toml .
COPY poetry.lock .

RUN python3 -m venv /venv
RUN python3 -m pip install poetry
RUN poetry export -f requirements.txt --output requirements.txt --without-hashes
RUN /venv/bin/pip install -r requirements.txt

FROM python:3.9-slim-buster AS app

RUN useradd -m myuser && \
    mkdir /app && \
    chown -R myuser /app
USER myuser

COPY . /app
WORKDIR /app

COPY --from=builder /venv /venv

CMD [ "python", "web_app/core.py" ]

EXPOSE 5000
