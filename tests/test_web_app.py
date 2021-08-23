from datetime import datetime, timedelta, timezone

import pytest
from flask import Response
from flask.testing import FlaskClient

from .context import web_app


@pytest.fixture
def http_client() -> FlaskClient:
    yield web_app.app.test_client()


@pytest.fixture
def moscow_time() -> datetime:
    yield datetime.now(timezone(timedelta(hours=3)))


def test_web_app(http_client, moscow_time) -> None:
    response: Response = http_client.get("/")
    assert response.status_code == 200 and response.data.decode(
        "ascii"
    ) == moscow_time.time().strftime("%H:%M:%S")
