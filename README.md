# ecs-fargate-restful-api-nodejs

step by step deploy restful api node js in ECS Fargate AWS :

1. You can create database in EC2 instance AWS

2. then, you must create container repository first. in this case, we use Elastic Container Registry as Container repository

    use this command : - aws ecr create-repository --repository-name repository_name

3. build sourcecode to be image container. then push image to ECR

    use this command : - docker build -t container_name .
                        
                       - docker tag imagesname:tag newimagesname:tag

                       - $(aws ecr get-login --no-include-email --region region_name) -> login to registry container

                       - docker push newimagesname:tag

                       - aws ecr describe-images --repository-name repo_name -> to check images after push
4. Now, Getting Started with Amazon Elastic Container Service (Amazon ECS) using Fargate

5. Container definitions (Regarding the host mapping, please see the next section ("Task definitions")

6. Task definitions :

   Here, we specify a task definition so Amazon ECS knows which Docker image to use for containers, how many containers to use in the task, and the resource allocation for each container.

7. Service definitions :

   Now that we have created a task definition, we will configure the Amazon ECS service. By running an application as a service, Amazon ECS will auto-recover any stopped tasks and maintain the number of copies we specify: it is meant to run indefinitely, so by running it as a service, it will restart if the task becomes unhealthy or unexpectedly stops.

   We can access our container app without using LB via Public IP which we can get from the Task Details page under the network section. For example, though our current container port 80, if the container is running on port xxxx, we can see the app using

   However, in this post, we're going to use a load balancer for our service.

   Note that for awsvpc mode, and therefore for Fargate, we use the IP target type instead of the instance target type.


   The two security groups will be created to secure our service:

   An Application Load Balancer security group that allows all traffic on the Application Load Balancer port
   
   An ECS security group that allows all traffic ONLY from the Application Load Balancer security group.

Note also that ECS will create a Service IAM Role named ecsServiceRole if it has not been created.