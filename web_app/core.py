from flask import Flask

import helpers

app = Flask(__name__)


@app.route("/")
def main() -> str:
    return helpers.get_moscow_time()


if __name__ == "__main__":
    app.run()
