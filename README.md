# Provision OS Playbook

Ansible playbook, which sets up freshly installed OS


# How to execute locally:

### Using Makefile:
1. Create the `hosts.yml` file, providing username instead of a placeholder (`cp hosts_example.yml hosts.yml`)
2. `make run`

### Manually:
To execute this playbook on freshly installed system, perform next steps:

1. Ensure you have `git` and `python3` packages installed

2. Install ansible <br/>
`brew install ansible`
or
`python3 -m pip install ansible --user`

3. Check if everything works (included path to executable in case it's not added to PATH yet) <br/>
`~/.local/bin/ansible --version` 

4. Clone playbook repo and `cd` there <br/>
`git clone https://github.com/rhrabun/provision-os-playbook.git && cd provision-os-playbook`

5. Create the `hosts.yml` file, providing username instead of a placeholder <br/>
`cp hosts_example.yml hosts.yml`

6. Dry-run execution <br/>
`~/.local/bin/ansible-playbook playbook.yml --check`

7. Run execution <br/>
`~/.local/bin/ansible-playbook playbook.yml --ask-become-pass`


# How to execute remotely:
* Check if connection works:
`ansible {all | alias | ip} -m ping`

* Run playbook
`ansible-playbook playbook.yml {-l alias OPTIONAL} --ask-become-pass`
