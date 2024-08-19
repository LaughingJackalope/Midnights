# Define variables for your CloudFormation stack names and output keys


# Define the path to your Ansible playbook
INVENTORY_PLAYBOOK := inventory.yaml
PLAYBOOK := playbook.yaml
PING_PLAYBOOK := ping.yaml

run:
	@echo hack to make ssh agent forwarding work
	@eval `ssh-add`
	@echo "Generating Ansible inventory from CloudFormation stack..."
	ansible-playbook $(INVENTORY_PLAYBOOK)
	@echo "Running Ansible playbook..."
	ansible-playbook $(PLAYBOOK) -i inventory.txt

#Target to ping the instances
check:
	ansible-playbook $(PING_PLAYBOOK) -i inventory.txt

# Target to clean up the generated inventory file
clean:
	rm -f inventory.txt

# Default target
.PHONY: all
all: run