pipeline {
    agent any
    environment {
        ECR_REPO = "023812455170.dkr.ecr.us-east-1.amazonaws.com/flask-apps"
        CONTAINER_NAME = "flask-container"
        STUB_VALUE = "200"
    }
    stages {
        stage('Stubs-Replacement'){
            steps {
                // 'STUB_VALUE' Environment Variable declared in Jenkins Configuration
                echo "STUB_VALUE = ${STUB_VALUE}"
                sh "sed -i 's/<STUB_VALUE>/$STUB_VALUE/g' config.py"
                sh 'cat config.py'
            }
        }
        stage('Build') {
            steps {
                //  Building new image
                sh 'docker image build -t $ECR_REPO:latest .'
                sh 'docker image tag $ECR_REPO:latest $ECR_REPO:$BUILD_NUMBER'

                //  Pushing Image to Repository
                sh 'docker push 023812455170.dkr.ecr.us-east-1.amazonaws.com/flask-apps:$BUILD_NUMBER'
                sh 'docker push 023812455170.dkr.ecr.us-east-1.amazonaws.com/flask-apps:latest'

                echo "Image built and pushed to repository"
            }
        }
    }
}