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
    stage('Check credentials') {
      withCredentials([usernamePassword(
        credentialsId: 'd4931fb9-9b04-4e6a-8a10-be214bd966b8',
        usernameVariable: 'GIT_USERNAME',
        passwordVariable: 'GIT_PASSWORD'
      )]) {
        sh '''
          echo "Username is $GIT_USERNAME"
          # DON'T echo the password! Avoid leaking secrets
        '''
      }
    }

    // stage('Build Docker Image') {
    //   steps {
    //       script {
    //           def image = docker.build("omrsaran/jen-sample:${env.BUILD_NUM}", '-f app/Dockerfile .')
    //           docker.withRegistry('https://index.docker.io/v1/', 'docker-cred') {
    //               image.push()
    //           }
    //       }
    //   }
    // }
    // stage('Update Image version in k8s deployment file') {
    //   steps {
    //     git(
    //       credentialsId: 'd4931fb9-9b04-4e6a-8a10-be214bd966b8', 
    //       url: 'https://github.com/sharanraj124/infra-terraform-node-setup.git',
    //       branch: 'main'
    //     )
    //     script {
    //         withCredentials([
    //             usernamePassword(
    //                 credentialsId: 'd4931fb9-9b04-4e6a-8a10-be214bd966b8',
    //                 usernameVariable: 'GIT_USERNAME',
    //                 passwordVariable: 'GIT_PASSWORD'
    //             )
    //         ]) {
    //             sh """
    //             echo '🔍 Before replacement:'
    //             cat deploy.yaml

    //             echo '🔧 Replacing 32 with build number: ${env.BUILD_NUM}'
    //             sed -i '' "s/32/${env.BUILD_NUM}/g" deploy.yaml

    //             echo '✅ After replacement:'
    //             cat deploy.yaml

    //             git config user.name "jenkins-bot"
    //             git config user.email "jenkins@example.com"

    //             git add deploy.yaml
    //             git commit -m '🔁 Updated deploy.yaml with build number ${env.BUILD_NUM}'

    //             git remote set-url origin https://$GIT_USERNAME:$GIT_PASSWORD@github.com/your/repo.git
    //             git push origin HEAD:main
    //             """
    //         }
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
