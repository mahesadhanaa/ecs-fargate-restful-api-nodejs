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

7.   