pipeline {
  agent {
    docker {
      image 'python:3.8-alpine'
      args '-u root:root'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'apk add --no-cache make build-base openssl-dev libffi-dev'
        sh 'python3 -m pip install poetry'
        sh 'poetry install'
      }
    }

    stage('Linting') {
      parallel {
        stage('Linting') {
          steps {
            sh 'poetry run pyupgrade'
            sh 'poetry run black .'
          }
        }

        stage('Testing') {
          steps {
            sh '''make test
'''
          }
        }

      }
    }

  }
  environment {
    CRYPTOGRAPHY_DONT_BUILD_RUST = '1'
  }
}
