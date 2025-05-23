pipeline {
  agent any
  environment {
      BUILD_NUM = "${BUILD_NUMBER}"
  }
//   agent {
//     docker { image 'node:16-alpine' }
//   }
  stages {
    stage('Checkout repository') {
      // agent {
      //   docker { image 'node:16-alpine' }
      // }
      steps {
          git(
            credentialsId: 'd4931fb9-9b04-4e6a-8a10-be214bd966b8', 
            url: 'https://github.com/sharanraj124/infra-terraform-node-setup.git',
            branch: 'main'
          )
      }
    }
    stage('Build Docker Image') {
      steps {
          script {
              def image = docker.build("omrsaran/jen-sample:${env.BUILD_NUM}", '-f app/Dockerfile .')
              docker.withRegistry('https://index.docker.io/v1/', 'docker-cred') {
                  image.push()
              }
          }
      }
    }
    // stage('Build Docker Image') {
    // //   steps {
    // //     docker build -f app/Dockerfile .
    // //   }
    //   steps {
    //     script {
    //         docker.build(
    //             'omrsaran/jen-sample',
    //             '-f app/Dockerfile .'
    //         )
    //     }
    //   }
    // }
  }
  post {
      success {
          echo '✅ Tests passed!'
      }
      failure {
          echo '❌ Tests failed!'
      }
      always {
          echo '🧹 Cleanup tasks'
      }
  }
}
