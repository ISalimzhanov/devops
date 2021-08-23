from datetime import datetime, timedelta, timezone


def get_moscow_time() -> str:
    tz = timezone(timedelta(hours=3))
    return datetime.now(tz).time().strftime("%H:%M:%S")
