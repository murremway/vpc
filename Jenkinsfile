pipeline {
agent any
options {
skipStagesAfterUnstable()
}
stages {
stage('Clone repository') { 
steps { 
script{
checkout scm
}
}
}
stage('Build') { 
steps { 
script{
app = sudo docker.build("HelloWorld")
}
}
}
stage('Test'){
steps {
echo 'Empty'
}
}
stage('Push') {
steps {
script{
docker.withRegistry('298436085140.dkr.ecr.us-east-1.amazonaws.com/my-docker-repo', 'ecr:us-east-2:aws-credentials') {
app.push("${env.BUILD_NUMBER}")
app.push("latest")
}
}
}
}
stage('Deploy'){
steps {
sh 'kubectl apply -f deployment.yml'
}
}

}
}
