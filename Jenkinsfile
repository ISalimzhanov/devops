pipeline {
  agent {
    docker {
      image '41694/devops_lab1'
    }

  }
  stages {
    stage('Linting') {
      steps {
        sh '''pushd ..
'''
        sh 'make lint'
        sh 'popd '
      }
    }

    stage('Testing') {
      steps {
        sh 'pushd ..'
        sh 'make test'
        sh 'popd'
      }
    }

  }
}