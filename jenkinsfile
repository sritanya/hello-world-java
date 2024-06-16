pipeline {
     agent any
       environment {
          PATH = "/Applications/apache-maven-3.9.7/bin:/Applications/Docker.app/Contents/Resources/bin:$PATH"

          }
          stages{
stage('Clone Repository'){
steps{
git url: 'https://github.com/sritanya/helloworld.git', branch: 'master'
//git url: "https://github.com/ravdy/DevOps.git", branch: 'master'
}
}
stage("compile"){
steps{
sh 'mvn clean compile'
sh 'pwd'
sh 'ls -ltr'
}
}
stage("test case"){
steps{
sh "mvn test"
}
}
stage('SonarQube Analysis') {
steps {
sh '''mvn clean verify sonar:sonar -Dsonar.projectKey=java -Dsonar.projectName='java' -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqa_120ec1ad1ae096602217fba256ab2e2d3d542a27''' //port 9000 is default for sonar
echo 'SonarQube Analysis Completed'
}
}
stage("build code"){
steps{
sh "mvn clean install"
}
}
stage('Build Docker Image') {
steps{
sh 'docker build -t helloworld .'

}
}

stage('Run Docker Container') {
steps {
script {
sh 'docker run -d -p 8080:8080 helloworld'
}
}
}
}
post {
success {
echo 'Build and deployment completed successfully.'
}
failure {
echo 'Build or deployment failed.'
}
}

}
