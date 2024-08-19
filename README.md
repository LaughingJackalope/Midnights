# Operation: Midnight

## Description
This is a simple demonstration of DevOps automation using CloudFormation, Ansible, and GNU Make.

## Prerequisites
- AWS CLI 
- ansible-playbook (I used 2.7.12)
- GNU Make
- An SSH keypair in AWS (future versions will solve this a different way)

## Usage
The automation path I'm using is as follows:

```bash
make deploy_all 
```

This will create the CloudFormation stack, and then run the Ansible playbook to configure the EC2 instances.


## Failure conditions and resolutions
- If the CloudFormation stack fails to create, you will need to delete the stack and try again.
  - make destroy ; make deploy will kick off the process again.

- If the inventory playbook fails something is wrong with the cloudformation stack.