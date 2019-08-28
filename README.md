# ecs-fargate-restful-api-nodejs

step by step deploy restful api node js in ECS Fargate AWS :

1. You can create database in EC2 instance AWS

2. then, you must create container repository first. in this case, we use Elastic Container Registry as Container repository

3. build sourcecode to be image container. then push image to ECR

    use this command : - docker build -t container_name .
                        
                       - docker tag imagesname:tag newimagesname:tag

                       - docker push newimagesname:tag
4. Create Cluster ECS

5. Before you can run Docker containers on Amazon ECS, you must create a task definition. You can define multiple containers and data volumes in a task definition. For more information about the parameters available in a task definition, see Task Definition Parameters.

