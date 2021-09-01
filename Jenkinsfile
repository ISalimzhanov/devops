pipeline {
  agent {
    docker {
      image 'python:3.8-alpine'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'apk add --no-cache make build-base openssl-dev libffi-dev'
        sh 'python3 -m pip install poetry'
        sh 'python3 -m venv /venv && make install PYTHON=/venv/bin/python3'
      }
    }

    stage('Linting') {
      parallel {
        stage('Linting') {
          steps {
            sh '''make lint
'''
          }
        }

        stage('Testing') {
          steps {
            sh 'make test'
          }
        }

      }
    }
  }

  environment {
    CRYPTOGRAPHY_DONT_BUILD_RUST = '1'
  }
}
