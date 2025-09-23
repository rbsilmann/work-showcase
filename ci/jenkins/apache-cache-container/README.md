## Overview
This repository contains a simple CI pipeline to build a Docker image.  
The Docker image uses the Apache cache module to maintain a web cache.

### Directory Structure
<pre>
ci/jenkins/apache-cache-container
├── cache.conf            # Configuration file used by the cache container
├── compose-cache.yaml    # Docker Compose for cache (testing purposes only)
├── compose.yaml          # Docker Compose for Jenkins container (pipeline testing only)
├── Dockerfile            # Dockerfile used by the Jenkins pipeline
├── Jenkinsfile           # Jenkinsfile used by the Jenkins app (pipeline testing only)
└── README.md             # This file
</pre>

### Prerequisites
1. [Docker Engine](https://docs.docker.com/engine/install/)
2. [Docker Socket Binding](https://www.jenkins.io/doc/book/pipeline/docker/)

### Running
After installing Docker Engine, follow these steps:

1. Start the Jenkins server:
```bash
docker compose up
```
2. Retrieve the initial password from the console output.  
3. Access the server once it is fully running at [http://localhost:8081](http://localhost:8081).  
4. Set an appropriate username and password following the installation instructions.  
5. Install the [Jenkins Docker Pipeline Plugin](https://plugins.jenkins.io/docker-workflow/).  
6. Create a credential named **credentials-id** with your Docker Hub credentials.  
7. Create a credential named **git** with your GitHub credentials.  
8. Create a Multibranch Pipeline job pointing to this repository:
   - **Branch Sources**: GitHub  
   - **Script Path**: `ci/jenkins/apache-cache-container/Jenkinsfile`  
   - Click **Save**

### Tests
Click **"Scan Repository Now"**. The job will start shortly.