.ONESHELL:
install-requirements:
	python3 -m pip install ansible --user
	~/.local/bin/ansible --version

run:
	~/.local/bin/ansible-playbook playbook.yml --ask-become-pass
