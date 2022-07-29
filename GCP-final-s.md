# GCP-final-task

## 1- preparing image for the project:

- clone Github repo to local machine
    
    `git clone [https://github.com/atefhares/DevOps-Challenge-Demo-Code.git](https://github.com/atefhares/DevOps-Challenge-Demo-Code.git)`
    
- create Dockerfile for this project
    
    ```docker
    FROM python:3.7-alpine3.15
    WORKDIR /app
    
    #--------------install requirements ----------------#
    RUN pip install redis
    RUN pip install tornado
    
    COPY . .
    
    #----------- EXPORT ENV VARS --------#
    ENV ENVIRONMENT=DEV
    ENV HOST=localhost
    ENV PORT=8000
    ENV REDIS_HOST=redis
    ENV REDIS_PORT=6379
    ENV REDIS_DB=0
    
    CMD [ "python3", "hello.py" ]
    ```
    

- create the image using Dockerfile
    
    `docker build . -t ahmedabdelsalam19/devops-challenge`
    
- tag the image
    
    `docker tag ahmedabdelsalam19/devops-challenge ahmedabdelsalam19/devops-challenge`
    
- push the image to Dockerhub [just for testing]
    
     `docker push ahmedabdelsalam19/devops-challenge` 
    
- using helm charts to deploy
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled.png)
    
- create deployment and service for application
- check pods and service
- good, all run successfully
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%201.png)
    

- generate url for app service using minikube
    
    `minikube service new-py-app-svc --url`
    
- open url to view results
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%202.png)
    
- we ensure that our image is running correctly

==========================================================================

## **push our image to Artifacts Repository**

- create artifact repo
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%203.png)
    

- tag local image and push it to our repo
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%204.png)
    
    - tag redis image and push it to our repo
        
        ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%205.png)
        

- artifact repo
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%206.png)
    

## **build infrastructure using Terraform**

- authenticate terraform with gcp through service account
- create resources
    
    `terraform init
    terraform plan
    terraform apply`
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%207.png)
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%208.png)
    

## **Deploy application**

- **connect private vm [using ssh]**
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%209.png)
    

- **move kubernetes yaml files to vm using secure copy [scp]**
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%2010.png)
    

- install kubectl [ `sudo yum install kubectl` ]
- install gcloud auth [ `sudo yum install google-cloud-sdk-gke-gcloud-auth-plugin` ]
- deploy kubernetes yml file using [ `kubectl create -Rf kubernetes_files` ]
- run the ingress ip  at port 8000
    
     
    
    ![Untitled](GCP-final-task%20cfc72a01d0dd4471a71f611e0172ceed/Untitled%2011.png)