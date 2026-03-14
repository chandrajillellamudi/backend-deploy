pipeline {
    agent {
        label 'AGENT-1'
    }
     options {
               
                timeout(time: 1, unit: 'HOURS')
                disableConcurrentBuilds() 
               // ansiColor('xterm')
            }
    parameters {
        string(name: 'AppVersion', defaultValue: '1.0.0', description: 'App version')
    }
     environment{
        def appVersion = '' //variable declaration
        nexusUrl = 'nexus.chandradevops.online:8081'
    }
    stages {
        stage ('read the version') {
            steps {
                sh "echo Application Version:${params.AppVersion}"
            }
        }
        stage ('init') {
            steps {
                sh """
                pwd
                cd terraform
                terraform init
                """
            }
        }
        stage ('plan') {
            steps {
                sh """
                pwd
                cd terraform
                terraform plan -var="AppVersion=${params.AppVersion}"
                """
            }
        }
        // stage ('apply') {
        //     steps {
        //         sh """
        //         cd terraform
        //         terraform apply -var="AppVersion=${params.AppVersion}" -auto-approve
        //         """
        //     }
        // }
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