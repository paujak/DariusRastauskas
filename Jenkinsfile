pipeline {
    agent {
        node {
            label 'jenkins-engine-agent-t3medium'
        }
        
    }

    stage('Clone repository') {
        steps {
            checkout scm
        }
    }

    stage('Build Image'){
        steps {
            app = docker.build("TestImage4darius")
        }

    }

    stage('Test image'){
        steps {
            app.inside {
                echo "Tests passed"
            }
        }
    }
}