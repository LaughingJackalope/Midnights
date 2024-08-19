# Operation: Midnight
## Mid-term Report

### Scope, Purpose, and Context
When designing a system I leverage the Heilmeier Catechism[^1]. I find that one of the most challenging questions is: "What are the mid-term and final “exams” to check for success?" I may not always include the answers to this question in the project proposal as it can be too much data for an initial presentation. However, committing a report on the mid-term "exams" to the ./Docs in the main code repo has always served me well. 

From the project proposal, for context: 

> Project Midnight aims to design and implement a scalable, automated, and monitored cloud infrastructure using AWS services and modern DevOps tools. The project will demonstrate the integration of AWS EC2 Auto Scaling, CloudFormation, VPC, Rocky Linux, Ansible, Ansible AWX, and Zabbix. This infrastructure will automatically adjust to changes in demand and ensure continuous monitoring and configuration management.

### Mid-term Status

#### Summary
Operation Midnight is progressing well. Code and documentation deliveries satisfy the largest number of foundational requirements but not the most complex functional requirements. Technical debt is minimal and risk for complex requirements is well-mitigated. Time and effort required initially over-estimated. Based on deliveries made to requirements remaining and emerging the Final Presentation could be completed in 4 days. 

#### Code Deliveries
* Cloudformation templates sufficient to deploy a VPC with a public subnet and a private subnet, and one test EC2 instance per subnet, as a design feature the test instances are also added to SSM which provides a promising integration path for the dynamic inventory requirements of Ansible AWX.
* Ansible playbooks sufficient to provision the deployed instances from my local machine. One playbook generates an inventory file with the appropriate ssh commands for tunneling into the private instance, and another runs some simple plays against the generated inventory to demonstrate functionality. 
* Makefiles sufficient to automate the testing of this system under development and to document the operational workflow. 

#### Documentation Deliveries
* Project Proposal: Output of SDLC Phase 3.[^2] This document contains the requirements and deliverables of Operation: Midnight 
* Mid-term Report: This document contains a report on requirements satisfied, progress plan and refined deliverables. 

#### Functional Requirements satisfied
* Initial setup requirements satisfied on arrival as I already had an AWS account with an SSH key registered in EC2 and the required software on my machine. Planning requirements satisfied by Project proposal document used as reference for project planning in JetBrains Space. 
* Networking Setup with CloudFormation satisfied by vpc.yaml[^3] which deploys the specified network configuration. 
* Compute Setup with CloudFormation satisfied by compute.yaml[^4] which deploys SSM managed EC2 instances, this implies iam roles and creates paths for future integrations. 
* Configuration Management with Ansible satisfied by ./Ansible, relies on cloudformation metadata to generate inventory, can be used to configure zabbix-agent into the instance. 

#### Functional Requirements remaining 
* AWX is not yet configured within the infrastructure but is configured on my local kubernetes cluster. 
  * AWX has complex deployment requirements and a supported deployment path which relies on Kubernetes.
  * Vendor provides a kubernetes operator and CRD for deployment, straight forward and reliable. 
* Zabbix is not yet configured within the infrastructure but is configured on my local kubernetes cluster
  * While Zabbix can be instantiated as an appliance from the AWS marketplace or deployed via Ansible, there is a compelling path offered by helm charts.
* Documentation is proceeding on pace with the project. 
  * Makefile automations will *make* presentation a lot easier by programmatically stepping through the commands required to deploy our infrastructure. 
  * Some demonstrations based on current progress have been shared privately. Feedback on the automation is positive but reaction is a little *'that's it?'*
    * Project scope was initially minimized to lower delivery risk, but there is some room in the resourcing to satisfy emerging requirements and address this particular feedback. 

#### Functional Requirements Emerging
* EKS is moving from nice-to-have to a soft requirement because of the golden paths through kubernetes provided by Zabbix and AWX.
  * This is a complication, but it drives value to the bottom line (the demo)
  * Some design cycles required to derive network design for EKS cluster with respect to demo VPC
  * A new planning and design cycle will be required to reduce risk. 
  * EKS deployment can be greatly simplified with eksctl[^5]
  * The path without kubernetes feature enhancement contains more undifferentiated heavy lifting and unmanaged risk than this path.
  * Feature enhancement should be documented separately from this mid-term report. 


[^1]  https://www.darpa.mil/work-with-us/heilmeier-catechism
[^2]  https://www.justice.gov/archive/jmd/irm/lifecycle/ch3.htm
[^3]  [Networking CloudFormation Template](CloudFormation/vpc.yaml) 
[^4]  [Compute CloudFormation Template](CloudFormation/compute.yaml)
[^5]  https://github.com/eksctl-io/eksctl
