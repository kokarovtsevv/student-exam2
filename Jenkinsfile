pipeline {

   agent { label 'app' }
   stages {
      stage('Installing app') {
         steps {
            sh 'python3 -m venv venv && . venv/bin/activate && pip3 install -e .'
         }
      }
      stage('Testing app') {
         steps {
            sh ". venv/bin/activate && pip3 install -e '.[test]' && coverage run -m pytest && coverage report"
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
