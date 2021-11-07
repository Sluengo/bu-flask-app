pipeline {
    agent any
    environment {
        ECR_REPO = "523805441269.dkr.ecr.us-east-1.amazonaws.com/flask-apps"
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
                // Test
                // Authenticate to ECR
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REPO'
                //  Building new image
                sh 'docker image build -t $ECR_REPO:latest .'
                
                sh 'docker image tag $ECR_REPO:latest $ECR_REPO:$BUILD_NUMBER'
                // sh 'LATEST_ID=$(docker images | awk '{print $3}' | awk 'NR==2')'
                //sh 'docker image tag $LATEST_ID $ECR_REPO'

                //  Pushing Image to Repository
                sh 'docker push $ECR_REPO:$BUILD_NUMBER'
                //sh 'docker push $ECR_REPO:latest'

                echo "Image built and pushed to repository"
            }
        }

        stage('Deploy') {
            steps {

                sh 'kubectl apply -f /opt/kube-config/deployment.yaml'
            }
        }
    }
}