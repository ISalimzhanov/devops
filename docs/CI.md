# CI best practices

## Github actions
* Install only necessary dependencies (by using poetry install --no-dev)
* Use GitHub-hosted runner in a public repository
* Use existing actions as actions/setup-python@v2 ("Set up Python 3.8" step) and actions/upload-artifact@v2 (Upload test results step)

## Jenkins
* Simple stages
* Install only necessary dependencies (by using poetry install --no-dev)
* Parallel jobs (Linting and testing) to make process faster
* Use containerization
