#!/usr/bin/env bash

# BEGIN CUSTOMIZATIONS #
ECS_REGION='us-west-2'
ECS_CLUSTER_NAME='name-of-ecs-cluster'
ECS_SERVICE_NAME='NameOfService'
ECS_TASK_DEFINITION_NAME='NameOfTaskDefinition'
ECR_NAME='name-of-ecr'
ECR_URI='account-number.dkr.ecr.us-west-2.amazonaws.com'
VERSION=$(date +%s)
AWSCLI_VER_TAR=1.11.91
# END CUSTOMIZATIONS #

# Docker operations

# Build the Docker image (to do asset and template compilation, etc.)
docker build --pull -t "${ECR_NAME}:latest" -f ./docker/Dockerfile .
# Tag the new Docker image to the remote repo (by date)
docker tag "${ECR_NAME}:latest" "${ECR_URI}/${ECR_NAME}:${ENVIRONMENT}-${VERSION}"
# Tag the new Docker staging image to the remote repo (by 'latest-${ENVIRONMENT}')
docker tag "${ECR_NAME}:latest" "${ECR_URI}/${ECR_NAME}:latest-${ENVIRONMENT}"
# Login to ECR
$(aws ecr get-login --region "${ECS_REGION}")
# Push to the remote repo (by date)
docker push "${ECR_URI}/${ECR_NAME}:${ENVIRONMENT}-${VERSION}"
# Push to the remote repo (by 'latest-staging')
docker push "${ECR_URI}/${ECR_NAME}:latest-${ENVIRONMENT}"