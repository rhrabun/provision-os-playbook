# Provision OS Playbook

Ansible playbook, which sets up freshly installed OS


# How to execute locally:
To execute this playbook on freshly installed system, perform next steps:
1. Ensure you have `git` and `python3` packages installed
2. Install `pip3` if not installed<br/>
`sudo apt install python3-pip`

3. Install ansible module <br/>
`python3 -m pip install ansible --user`

4. Check if everything works (included path to executable in case it's not added to PATH yet) <br/>
`~/.local/bin/ansible --version` 

5. Clone playbook repo and `cd` there <br/>
`git clone https://gitlab.com/Afandi_bobo/provision-os-playbook.git && cd provision-os-playbook`

6. Create `hosts.yml` file and provide missing values as shown in `hosts.example.yml` file <br/>
`cp hosts.example.yml hosts.yml`

7. Run execution <br/>
`~/.local/bin/ansible-playbook playbook.yml --ask-become-pass`


# How to execute remotely:
* Check if connection works:
`ansible {all | alias | ip} -m ping`

* Run playbook
`ansible-playbook playbook.yml {-l alias OPTIONAL} --ask-become-pass`


---

## ToDo's:
* Add installation of 
    * golang
    * kubectl

* Break down roles to separate package-related files.
For example: Role `common`, file `pip.yml` - upgrades pip and installs required pip packages
Role `common`, file `main.yml` imports `pip.yml` file
