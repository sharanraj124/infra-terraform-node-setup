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
              def shortSha = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
              sh """
              echo "shortSha value: ${shortSha}"
              """
              def imageTag = "${env.BUILD_NUM}-${shortSha}"
              def imageName = "your-repo/your-app:${imageTag}"
              def image = docker.build("omrsaran/jen-sample:${imageTag}", '-f app/Dockerfile .')
              docker.withRegistry('https://index.docker.io/v1/', 'docker-cred') {
                  image.push()
              }
              env.FINAL_IMAGE_TAG = imageTag
              env.FINAL_IMAGE_NAME = imageName
          }
      }
    }
    stage('Check credentials') {
      steps {
          withCredentials([usernamePassword(
            credentialsId: 'd4931fb9-9b04-4e6a-8a10-be214bd966b8',
            usernameVariable: 'GIT_USERNAME',
            passwordVariable: 'GIT_PASSWORD'
          )]) {
            sh '''
              echo "Username is $GIT_USERNAME"
              # DON'T echo the password! Avoid leaking secrets
                echo '🔍 Before replacement:'
                cat k8s/deploy.yaml
                echo "🔧 Replacing 32 with build number: ${FINAL_IMAGE_TAG}"
                sed -i "s|omrsaran/jen-sample:.*|omrsaran/jen-sample:${FINAL_IMAGE_TAG}|g" k8s/deploy.yaml
                echo '✅ After replacement:'
                cat k8s/deploy.yaml
            '''
          }
      }
    }
    // stage('Deploy to Minikube') {
    //   steps {
    //     script {
    //       echo '🚀 Deploying to Minikube...'

    //       // Show kubectl config for debug
    //       sh 'kubectl config current-context'

    //       // Apply the updated Kubernetes manifest
    //       sh 'kubectl apply -f k8s/deploy.yaml'
    //       sh 'kubectl get pods -A'

    //       // Optional: check rollout status
    //       // sh 'kubectl rollout status deployment/your-deployment-name -n your-namespace'
    //     }
    //   }
    // }
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
