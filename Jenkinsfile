pipeline {
   environment {
      DOCKERHUB_CREDS = ('docker_credentials')
   }

   agent { label 'app' }

   stages {
      stage('Installing app') {
         steps {
            sh 'python3 -m venv venv'
            sh '. venv/bin/activate'
            sh 'pip install -e .'
         }
      }
      stage('Testing app') {
         steps {
            sh 'pip install -e '.[test]''
            sh 'coverage run -m pytest'
            sh 'coverage report'
         }
      }
      stage('Building image') {
         steps {
            sh 'docker build -t kokarovtsevv/exam_image:webapp .'
         }
      }
      stage('Pushing image') {
         steps {
            sh 'docker login -u $DOCKERHUB_CREDS_USR -p $DOCKERHUB_CREDS_PSW'  
            sh 'docker push kokarovtsevv/exam_image:webapp'
         }
      }
   }
}
