pipeline {
  agent {
    docker {
      image '41694/devops_lab1'
    }

  }
  stages {
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