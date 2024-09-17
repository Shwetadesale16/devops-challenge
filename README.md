# Bird Application

Welcome to the Bird Application! This project demonstrates a full implementation of a Go-based application with two APIs, **Bird API** and **BirdImage API**, that are containerized, deployed on AWS, and orchestrated using Kubernetes(Minikube).

## Overview

In this assignment, I have completed the following:
1. **Installed and ran the Bird and BirdImage APIs**.
2. **Dockerized** both APIs.
3. Set up **infrastructure on AWS** using Infrastructure as Code (Terraform).
4. Installed and configured **MiniKube on EC2 instances**.
5. Deployed the APIs on Kubernetes using manifest files.
6. Bonus: Implemented best practices for **Helm**, and enabled **scaling** for the APIs.

## Table of Contents
- [Installation & Setup](#installation--setup)
- [Solution Breakdown](#solution-breakdown)
  - [Challenge 1: Running the APIs](#challenge-1-running-the-apis)
  - [Challenge 2: Dockerizing the APIs](#challenge-2-dockerizing-the-apis)
  - [Challenge 3: Infrastructure on AWS](#challenge-3-infrastructure-on-aws)
  - [Challenge 4: Kubernetes Installation](#challenge-4-kubernetes-installation)
  - [Challenge 5: Kubernetes Manifests](#challenge-5-kubernetes-manifests)
  - [Bonus: Observability, Helm, and Scaling](#bonus-observability-helm-and-scaling)
- [Conclusion](#conclusion)

## Installation & Setup

### Prerequisites:
1. **Go** (Install [here](https://golang.org/doc/install)).
2. **Docker** (Install [here](https://docs.docker.com/get-docker/)).
3. **AWS CLI** to manage AWS infrastructure.
4. **MiniKube** knowledge to manually set it up on EC2 instances.

## Solution Breakdown

### Challenge 1: Running the APIs
I started by running the APIs locally to ensure they were working correctly before moving on to containerization and deployment.

1. **Bird API**:
    ```bash
    cd bird
    go run main.go
    ```
    The API successfully starts and is available at `localhost:4201`.

2. **BirdImage API**:
    ```bash
    cd birdImage
    go run main.go
    ```
    The API successfully starts and is available at `localhost:4200`.

### Challenge 2: Dockerizing the APIs
I created Dockerfiles for both APIs and successfully built Docker images.

1. **Bird API**:
    - The `Dockerfile` is located in the `bird` folder.
    - Built the image and ran the container:
    ```bash
    docker build -t getbird .
    docker run -d -p 4201:4201 getbird getbird
    ```
2. **Docker network**:
   - Docker network was created as both APIs are dependant.
     docker network create bird-network
3. **BirdImage API**:
    - The `Dockerfile` is located in the `birdImage` folder.
    - Built the image and ran the container:
    ```bash
    docker build -t bird-image-api .
    docker run -d --name getbirdimage --network bird-network -p 4200:4200 getbirdimage
    ```
**Note**: Chnages needed to be done in code for accessing the APIs as they are in same docker network.
Both APIs successfully ran in their respective containers.

### Challenge 3: Infrastructure on AWS
I set up AWS infrastructure using Terraform. This included creating a VPC, Security Groups, and EC2 instances.

1. **Infrastructure as Code**: All configuration files are available in the `terraform` directory.
2. **Steps followed**:
    - Initialized Terraform and applied the configuration:
    ```bash
    cd terraform
    terraform init
    terraform apply
    ```

3. **Outcome**: The infrastructure was successfully provisioned on AWS, and EC2 instance(t2.small) was spun up, ready for Kubernetes installation.

### Challenge 4: Kubernetes Installation
Rather than using EKS, I manually installed Minikube on the EC2 instances which is lightest version of k8s.

**Outcome**: Kubernetes was successfully installed on the instances, and the cluster was ready for deploying the APIs.

### Challenge 5: Kubernetes Manifests
I created Kubernetes manifests for both APIs and deployed them in the cluster.

1. **Bird API**:
    - Created ` getbird-api-deployment.yaml` and ` getbird-api-service.yaml` files.
    - Applied the manifests to the cluster:
    ```bash
    kubectl apply -f getbird-api-deployment.yaml
    kubectl apply -f getbird-api-service.yaml
    ```

2. **BirdImage API**:
    - Created `getbird-image-deployment.yaml` and `getbird-image-service.yaml` files.
    - Applied the manifests to the cluster:
    ```bash
    kubectl apply -f getbird-image-deployment.yaml
    kubectl apply -f getbird-image-service.yaml
    ```

3. **Outcome**: Both APIs were successfully deployed and running in the Kubernetes cluster.

### Bonus: Observability, Helm, and Scaling

1. **Helm**:
    - Packaged the Kubernetes manifests into a Helm chart for both APIs, simplifying deployment:
    ```bash
    helm lint getbird-chart
    helm install getbird ./getbird-chart
    ```

2. **Scaling**:
    - Configured Horizontal Pod Autoscalers (HPA) to automatically scale the APIs based on resource utilization.
      
3. **Limited Resources**:
    - Attached Limited resource configurations in manifests to avoid resouce over usage.


5. **Outcome**: The APIs were deployable via Helm, and auto-scaled based on resource usage.

## Conclusion

In this assignment, I have completed all challenges and implemented the Bird Application using Docker, Kubernetes, and AWS. The project follows best practices for containerization, security, and cloud infrastructure. Additionally, scalability were implemented for future-proofing the system.

**Note**: Document is added in repository giving detailed information about the solution and screenshots for the reference.
          Name: Bird API_Assignment.docx

