pipeline {
  environment {
    imagename = "helloworld"
    ecrurl = "298436085140.dkr.ecr.us-east-1.amazonaws.com"
    ecrcredentials = "ecr:us-east-i:helloworld"
    dockerImage = ''
  } 
  agent any
  stages {
    stage('Cloning Git') {
      steps {
                checkout scm

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
   
    stage('Push') {
      steps {
        script{
          docker.withRegistry("https://298436085140.dkr.ecr.us-east-1.amazonaws.com", "ecr:us-east-1:my.aws.credentials") {
            docker.image("helloworld").push()
          }
        }
      }
    }

 
    stage('Remove Unused docker image - Master') {
      when {
      anyOf {
            branch 'master'
      }
     }
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    } // End of remove unused docker image for master
  }  
} //end of pipeline
