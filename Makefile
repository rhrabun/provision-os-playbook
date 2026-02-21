.ONESHELL:
install-requirements:
	sudo apt update
	sudo apt -y install python3-pip
	python3 -m pip install ansible --user
	~/.local/bin/ansible --version

run-ansible:
	~/.local/bin/ansible-playbook playbook.yml --ask-become-pass


