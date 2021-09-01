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
make lint
popd '''
      }
    }

    stage('Testing') {
      steps {
        sh '''pushd ..
make test
popd '''
      }
    }

  }
}