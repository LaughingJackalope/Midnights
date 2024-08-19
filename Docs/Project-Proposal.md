# **Project Proposal: Project Midnight**

---

## **Project Title**: Project Midnight

## **Project Summary**
Project Midnight aims to design and implement a scalable, automated, and monitored cloud infrastructure using AWS services and modern DevOps tools. The project will demonstrate the integration of AWS EC2 Auto Scaling, CloudFormation, VPC, Rocky Linux, Ansible, Ansible AWX, and Zabbix. This infrastructure will automatically adjust to changes in demand and ensure continuous monitoring and configuration management.

## **Project Objectives**
1. **Automate Infrastructure Deployment**: Use AWS CloudFormation to create a VPC, deploy EC2 instances running Rocky Linux, and implement Auto Scaling to dynamically adjust the number of instances based on load.
2. **Implement Configuration Management**: Use Ansible and Ansible AWX to automate the configuration of EC2 instances, ensuring consistent and secure setups across the infrastructure.
3. **Continuous Monitoring**: Deploy Zabbix to monitor the infrastructure, providing real-time alerts and performance metrics.
4. **Seamless Integration with Auto Scaling**: Ensure that both Ansible AWX and Zabbix are aware of new instances created by Auto Scaling, allowing them to be automatically configured and monitored without manual intervention.

## **Scope**
- **In Scope**:
  - Deployment of a secure and scalable VPC using AWS CloudFormation.
  - Automated configuration management using Ansible and Ansible AWX.
  - Implementation of Zabbix for infrastructure monitoring.
  - Integration with AWS Auto Scaling to dynamically manage EC2 instances.
- **Out of Scope**:
  - Application development or deployment beyond basic services for demonstration.
  - Cost optimization beyond basic AWS free-tier considerations.

## **Deliverables**
1. **Networking**:
   - CloudFormation templates for VPC, subnets, route tables, and security groups.
   - Secure and scalable network architecture including NAT gateways and internet gateways.
   - Documentation of the VPC design and network configurations.
   
2. **Compute**:
   - CloudFormation templates for EC2 instances and Auto Scaling groups.
   - Ansible playbooks and roles for configuring Rocky Linux EC2 instances.
   - Dynamic inventory scripts for Ansible AWX.
   - Zabbix monitoring setup including server and agent configuration.
   - Documentation of compute resources, configurations, and monitoring setup.

3. **Final Demonstration**:
   - A live or recorded demo showcasing the automated infrastructure, the dynamic response to auto-scaling events, and the monitoring setup.

## **Project Plan**

### **Phase 1: Planning and Initial Setup**
- **Objective**: Define project requirements, set up AWS environment.
- **Tasks**:
  - Define project requirements and objectives.
  - Set up AWS environment and initial resources (S3 bucket, IAM roles).
  - Deliverable: Project Requirements Document.

### **Phase 2: Networking Setup with CloudFormation**
- **Objective**: Deploy a secure VPC and networking components using CloudFormation.
- **Tasks**:
  - Develop CloudFormation templates to create the VPC, public and private subnets, route tables, and security groups.
  - Configure NAT gateways for secure internet access in private subnets.
  - Test network connectivity between subnets and to the internet.
  - Deliverable: CloudFormation template and deployed VPC.

### **Phase 3: Compute Setup with CloudFormation**
- **Objective**: Deploy EC2 instances and configure Auto Scaling using CloudFormation.
- **Tasks**:
  - Develop CloudFormation templates to launch EC2 instances running Rocky Linux.
  - Implement Auto Scaling to dynamically manage instance counts based on load.
  - Parameterize CloudFormation templates for flexibility.
  - Deliverable: CloudFormation template and deployed EC2 instances.

### **Phase 4: Configuration Management with Ansible**
- **Objective**: Automate the configuration of EC2 instances using Ansible.
- **Tasks**:
  - Write Ansible playbooks to configure Rocky Linux EC2 instances.
  - Implement dynamic inventory scripts to integrate with AWX.
  - Test the playbooks on deployed instances.
  - Deliverable: Ansible playbooks and AWX configurations.
YOU AER HERE
### **Phase 5: Monitoring with Zabbix**
- **Objective**: Implement Zabbix for real-time infrastructure monitoring.
- **Tasks**:
  - Deploy Zabbix server and configure agents on EC2 instances.
  - Set up auto-discovery or API integration for monitoring new instances.
  - Configure alerting and notifications for critical events.
  - Deliverable: Zabbix monitoring setup and configured alerts.

### **Phase 6: Integration and Testing**
- **Objective**: Integrate AWX and Zabbix with Auto Scaling, test full setup.
- **Tasks**:
  - Ensure new instances created by Auto Scaling are automatically added to Zabbix and AWX.
  - Conduct thorough testing of the infrastructure, including scaling events.
  - Deliverable: Test reports and validation documentation.

### **Phase 7: Documentation and Final Presentation**
- **Objective**: Document the project and prepare for the final demo.
- **Tasks**:
  - Document the deployment, configuration, and monitoring processes.
  - Prepare a final demonstration of the project.
  - Deliverable: Comprehensive project documentation and final demo.

## **Timeline**
- **Phase 1**: 1 week
- **Phase 2**: 2 weeks
- **Phase 3**: 2 weeks
- **Phase 4**: 2 weeks
- **Phase 5**: 2 weeks
- **Phase 6**: 1 week
- **Phase 7**: 1 week
- **Total Duration**: 11 weeks

## **Resources Required**
- **AWS Services**: EC2, VPC, S3, IAM, Auto Scaling, CloudFormation
- **Tools**: Ansible, Ansible AWX, Zabbix, Kubernetes (for AWX)
- **Human Resources**: Just little ol me. 
- **Budget**: Estimated AWS costs (under the free tier or specified budget limit)

## **Risks and Mitigations**
- **Risk**: AWS service limits or costs exceeding expectations.
  - **Mitigation**: Monitor usage closely, leverage AWS free tier, and optimize resource usage.
- **Risk**: Integration issues between Auto Scaling, Ansible AWX, and Zabbix.
  - **Mitigation**: Conduct thorough testing and implement fallback monitoring scripts.
- **Risk**: Complexity in automation scripts leading to deployment failures.
  - **Mitigation**: Incremental testing and use of version control for all scripts and configurations.

## **Conclusion**
Project Midnight will showcase the ability to create a fully automated, scalable, and monitored cloud infrastructure using industry-standard tools. The successful completion of this project will demonstrate proficiency in AWS, DevOps automation, and infrastructure monitoring, positioning the team to manage complex cloud environments efficiently.