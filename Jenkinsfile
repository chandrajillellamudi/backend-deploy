pipeline {
    agent {
        label 'AGENT-1'
    }
     options {
               
                timeout(time: 1, unit: 'HOURS')
                disableConcurrentBuilds() 
                ansiColor('xterm')
            }
    environment {
      def AppVersion = ''
      nexusURL = 'nexus.chandradevops.online:8081'
    }
    parameters {
        string(name: 'AppVersion', defaultValue: '1.0.0', description: 'App version')
    }
    stages {
        stage ('read the version') {
            steps {
                sh 'echo "Application Version: $AppVersion"'
            }
        }
    }
     post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success { 
            echo 'I will always say Hello when pipeline success'
        }
        failure { 
            echo 'I will always say Hello when pipeline fails'
        }
    }

}