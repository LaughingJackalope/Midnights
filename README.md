# Operation: Midnight

## Description
This is a demonstration of DevOps automation of AWS, and Rocky Linux using CloudFormation, Ansible, and Make. 

## Prerequisites
* AWS CLI 
* ansible-playbook (I used 2.7.12)
* Make
* SSH key setup:
  * SSH keypair egistered in ec2 as 'magic' and present at ~/.ssh/id_rsa

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
* Cloudformation stacks are specified for us-west-1 on a relatively unrestricted AWS account, you may run into permission or policy issues.
* Cloudformation will fail if the designated ssh key name is not registered in ec2.
* Ansible will fail if the ssh key setup is incorrect. 
