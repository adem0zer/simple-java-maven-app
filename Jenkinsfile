pipeline {
    agent any
    environment {
        KOK     = "$WORKSPACE"
        SURUM   = "1.2.$BUILD_ID"
    }
    stages {
        stage('Git-Pull') {
            steps {
                git branch: "master",
                url: "https://github.com/adem0zer/simple-java-maven-app.git"
            }
        }
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Docker-Build') {
            steps {
                sh " docker image build -t app.jar:latest . "
                sh " docker run docker.io/library/app.jar:latest "
            }
        }
        stage('Invoke-k8s-config') {
            environment {
              KUBECONFIG = "/home/adem/.kube/config"
            }
            steps {
                sh " kubectl set image deployment/simple-java-deployment=app.jar:latest "
            }
        }
    }
}