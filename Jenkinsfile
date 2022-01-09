pipeline {
  environment {
    imagename = "ismailtest"
    ecrurl = "https://hub.docker.com/repository/docker/dariusrastauskas/dariusdockerrepo"
    ecrcredentials = ""
    dockerImage = ''
  } 
  gent {
        node {
            label 'jenkins-engine-agent-t3medium'
        }
  }

  stages {
    stage('Cloning Git') {
      steps {
                git([url: 'https://github.com/DariusRastauskas/DariusRastauskas.git', branch: 'main'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
   
stage('Deploy Master Image') {
   when {
      anyOf {
            branch 'main'
      }
     }
      steps{
        script {
          docker.withRegistry(ecrurl, ecrcredentials) {     
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }

 
    stage('Remove Unused docker image - Master') {
      when {
      anyOf {
            branch 'main'
      }
     }
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    } // End of remove unused docker image for master
  }  
} //end of pipeline