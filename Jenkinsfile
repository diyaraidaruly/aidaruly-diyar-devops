pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Diyar'
        STUDENT_SURNAME = 'Aidaruly'
        STUDENT_GROUP   = 'IT2-2307'
        STUDENT_ID      = '37452'
        IMAGE_NAME      = 'aidaruly-diyar-devops'
        CONTAINER_NAME  = 'aidaruly-diyar-jenkins'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'echo "Student: $STUDENT_NAME $STUDENT_SURNAME"'
                sh 'echo "Group: $STUDENT_GROUP"'
                sh 'echo "Student ID: $STUDENT_ID"'
                sh 'echo "Git commit used by Jenkins:"'
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x app/app.sh'
                sh 'ls -la'
                echo 'Build completed'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f Dockerfile'
                sh 'test -f app/app.sh'
                sh 'sh app/app.sh | grep "Application is running successfully!"'
                echo 'All checks passed'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
                sh 'docker images $IMAGE_NAME'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh '''
                    docker run --name $CONTAINER_NAME \
                      -e STUDENT_NAME=$STUDENT_NAME \
                      -e STUDENT_SURNAME=$STUDENT_SURNAME \
                      -e STUDENT_GROUP=$STUDENT_GROUP \
                      -e STUDENT_ID=$STUDENT_ID \
                      $IMAGE_NAME:latest
                '''
                sh 'docker ps -a --filter name=$CONTAINER_NAME'
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the Console Output.'
        }
    }
}
