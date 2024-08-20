# Operation: Midnight

## Description
This is a demonstration of DevOps automation of AWS, and Rocky Linux using CloudFormation, Ansible, and Make. 

## Prerequisites
* AWS CLI 
* ansible-playbook (I used 2.7.12)
* Make
* SSH key setup:
  * SSH keypair registered in ec2 as 'magic' and present at ~/.ssh/id_rsa

## Usage
Deployment takes on average about five minutes. 

```bash
make deploy
```

This will create the CloudFormation stacks `vpc` and `compute`, and then run the Ansible playbook to configure the EC2 instances. EC2 resources and the nat gateway in private VPC have costs associated so be sure to run:

```bash
make destroy
```
Every change made to your aws account will be in a cloudformation stack (except the ssh key) so while the `make destroy` target does check that resources are deleted you can validate this yourself by looking for the cloudformation stacks `make deploy` creates.  

## Failure conditions
CloudFormation will take a while to fail if the designated ssh key name is not registered in ec2.
```
Failed to create/update the stack. Run the following command
to fetch the list of events leading up to the failure
aws cloudformation describe-stack-events --stack-name compute
make[2]: *** [deploy_compute] Error 255
make[1]: *** [deploy] Error 2
make: *** [deploy] Error 2
```
Run `make destroy` to clean this up. 

Ansible will fail if the ssh key setup is incorrect. 

`make destroy` will fail if cloudformation stacks were deleted manually.