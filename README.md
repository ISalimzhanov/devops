# DevOps Lab1:
## Installation
1) Clone the repository
```
git clone https://github.com/ISalimzhanov/devops
```
2) Install dependencies
```
make install
```

## Docker:
Docker image for the application is available at [docker hub repository](https://hub.docker.com/repository/docker/41694/devops_lab1:latest) <br/>
Image can be pulled by following command
```
docker pull 41694/devops_lab1:latest
```

## Run:
* Using docker
```
docker run 41694/devops_lab1:latest
```
* Using docker-compose
```
docker-compose up
```
* Install project (see Installation) and run run.py script
```
python run.py
```

## Testing
[Pytest](https://docs.pytest.org) is used for testing </br>
Use following command to launch testing
```
make test
```
