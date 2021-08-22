from setuptools import find_packages, setup

with open("README.md") as f:
    readme = f.read()

with open("LICENSE") as f:
    license = f.read()

setup(
    name="Simple web app to show current time in Moscow",
    version="0.1.0",
    description="Simple web app to show current time in Moscow",
    long_description=readme,
    author="Iskander Salimzhanov",
    url="https://github.com/ISalimzhanov/devops_lab1",
    license=license,
    packages=find_packages(exclude=("tests", "docs")),
)
