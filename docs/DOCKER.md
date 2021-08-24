#Best practices used
* Docker linter: https://hadolint.github.io/hadolint/
* Lightweight image using python:3.8-alpine
* Exclude unwanted files and directories by .dockerignore
* Directly exposing ports: using EXPOSE 5000
* Multistaging to make final image more lightweight
* They add a new security layer by avoiding giving root privileges
