from flask import Flask

import web_app.helpers as helpers

app = Flask(__name__)


@app.route("/")
def main() -> str:
    return helpers.get_moscow_time()


if __name__ == "__main__":
    app.run(host="0.0.0.0")
