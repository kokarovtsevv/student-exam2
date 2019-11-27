pipeline {

   agent { label 'app' }
   stages {
      stage('Installing app') {
         steps {
            sh 'sudo pip install .'
         }
      }
      stage('Testing app') {
         steps {
            sh "sudo pip install -e '.[test]' && coverage run -m pytest && coverage report"
         }
      }
      stage('Building and pushing image') {
         steps {
            script { 
               def docker_image = docker.build("kokarovtsevv/exam_image:webapp")
               docker.withRegistry('', 'docker_credentials') {
               docker_image.push()
	       }
            }
         }
      }
   }
 }
