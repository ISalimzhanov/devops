from datetime import datetime

import pytz


def get_moscow_time() -> str:
    tz = pytz.timezone("Europe/Moscow")
    return datetime.now(tz).time().strftime("%H:%M:%S")
