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
        choice(name: 'Action', choices: ['apply', 'destroy'], description: 'Terraform action')

    }
     environment{
        def appVersion = '' //variable declaration
        // APP_VERSION = "${params.AppVersion}"
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
             when {
                expression { return params.Action == 'apply' }
            }
            steps {
                sh """
                pwd
                cd terraform
                terraform plan -var="AppVersion=${params.AppVersion}"
                """
            }
        }
        stage ('apply') {
             when {
                expression { return params.Action == 'apply' }
            }
            steps {
                sh """
                cd terraform
                terraform apply -var="AppVersion=${params.AppVersion}" -auto-approve
                """
            }
        }
        stage ('destroy') {
             when {
                expression { return params.Action == 'destroy' }
            }
            steps {
                sh """
                cd terraform
                terraform destroy -var="AppVersion=${params.AppVersion}" -auto-approve
                """
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