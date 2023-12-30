pipeline {
    agent any

    stages {
        stage('git-checkout-files') {
            steps {
            echo "checkout all the files";
		    git url: 'https://github.com/parimiprasanna/test.git', branch: 'main'
            }
        }
		
stage('Development') {
        steps {
            sh 'bash deploy.sh'
		    echo "Deployed successfully";
		    
		}
	  }
		stage('Test') {
	    steps {
	        sh 'bash deploy.sh'
		    echo " Deploy successful on Test";
		}
	  }
	
	stage('Preprod') {
	    steps {
	        sh  'bash deploy.sh'
		    echo " Deploy successful on Test";
		}
	  }
	stage('Production') {
	    steps {
	        sh 'bash deploy.sh'
		    echo " Deploy successful on Test";
		}
	  }
	 }
post {
	      always {
		      echo "This will always run"
		  }
     success {
	         echo "This will run on if successfull"
		  }
		  
	 failure {
	         echo "This will run on if failed"
		  }	  
		  
	 unstable {
	         echo "This will run on if the run was marked as unstable"
		  }	  
		  	  
	 changed {
	         echo "This will run only if the state of the pipeline changed"
			 echo "For example, if the Pipline was previously failing but is now successful"
		  }
	     }
        }   
