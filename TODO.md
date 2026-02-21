## Todo

- [x] Get rid of config files and rewrite to use Stow
- [ ] Rewrite to better directory structure following [this](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#directory-layout)
- [ ] Make use of `tags` - for example, dev_env tag installs only tools for development; personal tag installs everything including browser, pass manager, chat apps, etc. 
* per-role tags to run specific role
* Env tags to run specific tasks/configurations:
  * dev - development environment
  * user - personal use system
  * core - core utils ?
- [ ] New packages to install:
  * Stow
  * uv
  * tmux
  * ghostty
  * Zed
  * Zen
- [x] Install Nerd font