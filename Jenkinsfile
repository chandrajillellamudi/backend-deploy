pipeline {
    agent {
        label 'AGENT-1'
    }
     options {
               
                timeout(time: 1, unit: 'HOURS')
                disableConcurrentBuilds() 
                ansiColor('xterm')
            }
    parameters {
        string(name: 'AppVersion', defaultValue: '1.0.0', description: 'App version')
    }
    stages {
        stage ('read the version') {
            steps {
                sh "echo Application Version:${params.AppVersion}"
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