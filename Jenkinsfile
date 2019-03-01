node('deploy') {
    def app

    stage('Clone repository locally') {
       
        checkout scm
  
    }   
	  
	stage('Build image') {
       

        app = docker.build("1545662258668/node1")
        app.push()
		
    }
}

node('deploy'){

    stage('pull image'){
        sh "docker pull 1545662258668/node1"
	sh "wget https://raw.githubusercontent.com/NikolayMarusenko/project-todo/master/docker-compose.yaml"
	    }
    
    stage('stop/delite all containers'){
       sh "docker stop \$(docker ps -a -q) || true"
       sh "docker rm \$(docker ps -a -q) || true"
    }

    stage('run image') {
        sh "docker-compose -f docker-compose.yaml up -d"    
    }
    
}

