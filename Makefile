# Define the paths to the Makefiles in the subdirectories
CLOUDFORMATION_DIR := ./CloudFormation
ANSIBLE_DIR := ./Ansible

# Target to deploy all resources
deploy:
	$(MAKE) -C $(CLOUDFORMATION_DIR) deploy
	$(MAKE) -C $(ANSIBLE_DIR) run

# Target to destroy all resources
destroy:
	$(MAKE) -C $(CLOUDFORMATION_DIR) destroy
	$(MAKE) -C $(ANSIBLE_DIR) clean

# Target to inspect the status of the stacks and instances
check:
	$(MAKE) -C $(CLOUDFORMATION_DIR) check_compute
	$(MAKE) -C $(CLOUDFORMATION_DIR) check_vpc

# Default target
.PHONY: all
all: deploy
