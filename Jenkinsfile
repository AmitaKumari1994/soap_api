pipeline {
    agent any

    environment {
        MULE_ENV = 'Sandbox'
        MULE_TARGET = 'Cloudhub-US-East-2'
        MULE_APPLICATION_NAME = 'soap-api'
        MULE_RUNTIME_VERSION = '4.9.8:6-java17'
        ANYPOINT_USERNAME = 'sfx'
        ANYPOINT_PASSWORD = 'Avaamo1234#'
    }

    stages {
        stage('Init') {
            steps {
                echo '🏗️ Jenkinsfile started executing...'
                bat 'echo Current directory && cd && dir'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Deploy to CloudHub 2.0') {
            steps {
                bat """
                    mvn deploy -DskipTests ^
                        -DmuleDeploy ^
                        -Danypoint.username=%ANYPOINT_USERNAME% ^
                        -Danypoint.password=%ANYPOINT_PASSWORD% ^
                        -Dmule.environment=%MULE_ENV% ^
                        -Dapp.runtime=%MULE_RUNTIME_VERSION% ^
                        -Dcloudhub2Deployment.target=%MULE_TARGET% ^
                        -Dcloudhub2Deployment.applicationName=%MULE_APPLICATION_NAME%
                """
            }
        }
    }
