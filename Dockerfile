FROM python:3.9-slim-buster

RUN python -m pip install poetry
RUN mkdir /app
WORKDIR /app

COPY pyproject.toml .
COPY poetry.lock .
COPY requirements.txt .

RUN poetry export -f requirements.txt --output requirements.txt --without-hashes
RUN pip3 install -r requirements.txt

COPY . /app

CMD [ "python", "run.py" ]

EXPOSE 5000
