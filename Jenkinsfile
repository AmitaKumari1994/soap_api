pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/AmitaKumari1994/soap_api.git'
        BRANCH = 'main'
        MULE_ENV = 'Sandbox'
        MULE_TARGET = 'Cloudhub-US-East-2'
        MULE_APPLICATION_NAME = 'soap-api'
        MULE_RUNTIME_VERSION = '4.9.8:6-java17'
        ANYPOINT_USERNAME = 'sfx'
        ANYPOINT_PASSWORD = 'Avaamo1234#'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${BRANCH}", url: "${GIT_REPO_URL}"
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Deploy to CloudHub 2.0') {
            steps {
                sh """
                    mvn deploy -DskipTests \
                        -DmuleDeploy \
                        -Danypoint.username=$ANYPOINT_USERNAME \
                        -Danypoint.password=$ANYPOINT_PASSWORD \
                        -Dmule.environment=$MULE_ENV \
                        -Dapp.runtime=$MULE_RUNTIME_VERSION \
                        -Dcloudhub2Deployment.target=$MULE_TARGET \
                        -Dcloudhub2Deployment.applicationName=$MULE_APPLICATION_NAME
                """
            }
        }
    }

    post {
        success {
            echo 'Build, test, and deployment completed successfully!'
        }
        failure {
            echo 'One or more stages failed.'
        }
    }
}
