pipeline {
  agent any
//   agent {
//     docker { image 'node:16-alpine' }
//   }
  stages {
    stage('Test') {
      agent {
        docker { image 'node:16-alpine' }
      }
      steps {
        sh 'node --version'
      }
    }
    stage('Build') {
      steps {
        docker build app/
      }
    }
  }
}
