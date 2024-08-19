# Define the AWS region
AWS_REGION := us-west-1

# Deploy the VPC stack
deploy_vpc:
	aws cloudformation deploy --stack-name vpc --template-file vpc.yaml --region $(AWS_REGION)

# Deploy the compute stack
deploy_compute:
	aws cloudformation deploy --stack-name compute --template-file compute.yaml --region $(AWS_REGION) --capabilities CAPABILITY_NAMED_IAM

# Target to deploy both stacks
deploy:
	$(MAKE) deploy_vpc
	$(MAKE) deploy_compute

# Check the status of the VPC stack
check_vpc:
	aws cloudformation describe-stacks --stack-name vpc --region $(AWS_REGION)

# Check the status of the compute stack
check_compute:
	aws cloudformation describe-stacks --stack-name compute --region $(AWS_REGION)

# Destroy the VPC stack
destroy_vpc:
	aws cloudformation delete-stack --stack-name vpc --region $(AWS_REGION)

# Destroy the compute stack
destroy_compute:
	aws cloudformation delete-stack --stack-name compute --region $(AWS_REGION)

# Target to destroy both stacks
destroy:
	$(MAKE) destroy_compute
	echo "Destroying compute stack...waiting for confirmation..."
	aws cloudformation wait stack-delete-complete --stack-name compute --region $(AWS_REGION)
	echo "Compute stack destroyed. Now destroying VPC stack...waiting for confirmation..."
	$(MAKE) destroy_vpc
	aws cloudformation wait stack-delete-complete --stack-name vpc --region $(AWS_REGION)
	echo "VPC stack destroyed."


# Default target
.PHONY: all
all: deploy
