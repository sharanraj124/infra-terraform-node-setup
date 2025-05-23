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
    stage('Build Docker Image') {
    //   steps {
    //     docker build -f app/Dockerfile .
    //   }
      steps {
        script {
            docker.build(
                'omrsaran/jen-sample',
                '-f app/Dockerfile .'
            )
        }
      }
    }
  }
}
