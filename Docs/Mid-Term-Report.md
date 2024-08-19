# Operation: Midnight
## Mid-term Report

### Scope, Purpose, and Context
When designing a system I leverage the Heilmeier Catechism[^1]. I find that one of the most challenging questions is: "What are the mid-term and final “exams” to check for success?" I may not always include the answers to this question in the project proposal as it can be too much data for an initial presentation. However, committing a report on the mid-term "exams" to the ./Docs in the main code repo has always served me well. 

From the project proposal, for context: 

> Project Midnight aims to design and implement a scalable, automated, and monitored cloud infrastructure using AWS services and modern DevOps tools. The project will demonstrate the integration of AWS EC2 Auto Scaling, CloudFormation, VPC, Rocky Linux, Ansible, Ansible AWX, and Zabbix. This infrastructure will automatically adjust to changes in demand and ensure continuous monitoring and configuration management.

### Mid-term Status

#### Project Outlook
Operation Midnight is progressing well. Code and documentation deliveries satisfy the largest number of foundational requirements but not the most complex functional requirements. 

#### Code Deliveries
    - Cloudformation templates sufficient to deploy a VPC with a public subnet and a private subnet, and one test EC2 instance per subnet, as a design feature the test instances are also added to SSM which provides a promising integration path for the dynamic inventory requirements of Ansible AWX
    - Ansible playbooks sufficient to provision the deployed instances from my local machine. One playbook generates an inventory file with the appropriate ssh commands for tunneling into the private instance, and another runs from some simple plays against the generated inventory to demonstrate functionality. 
    - Makefiles sufficient to automate the testing of this system under development and to document the operational workflow. 

#### Documentation Deliveries
    - Project Proposal: Output of SDLC Phase 3.[^2] This document contains the requirements and deliverables of Operation: Midnight
    - Mid-term Report: This document contains a report on requirements satisfied and refined deliverables. 



[^1]  https://www.darpa.mil/work-with-us/heilmeier-catechism
[^2]  https://www.justice.gov/archive/jmd/irm/lifecycle/ch3.htm