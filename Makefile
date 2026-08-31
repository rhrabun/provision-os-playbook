# Run `make` to see commands

.PHONY: help run run-tag dry-run dry-run-tag install
.DEFAULT_GOAL := help

# Host or host group to target, from inventory
host ?= personal

# Prompt for SSH password only for remote hosts
ASK_PASS := $(if $(filter personal,$(host)),,--ask-pass)

UNAME_S := $(shell uname -s)

# OS-specific 
ifeq ($(UNAME_S),Darwin)
	INSTALL_CMD := brew install
else ifeq ($(UNAME_S),Linux)
	INSTALL_CMD := python3 -m pip install --user
else
	$(error Unsupported OS: $(UNAME_S))
endif

help: ## Show help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

install: ## Install Ansible and dependencies
	$(INSTALL_CMD) ansible
	ansible --version

run: ## Run Ansible playbook for host or host group (e.g. `make run host=vps`)
	ansible-playbook playbook.yml --limit $(host) --ask-become-pass $(ASK_PASS)

run-tag: ## Run Ansible playbook with specific tag (e.g. `make run-tag tag=terminal`)
	ansible-playbook playbook.yml --limit $(host) --ask-become-pass $(ASK_PASS) -t $(tag)

dry-run: ## Dry-run Ansible playbook
	ansible-playbook playbook.yml --check --diff --limit $(host) --ask-become-pass $(ASK_PASS)

dry-run-tag: ## Dry-run Ansible playbook with specific tag (e.g. `make run-tag tag=terminal`)
	ansible-playbook playbook.yml --check --diff --limit $(host) --ask-become-pass $(ASK_PASS) -t $(tag)
