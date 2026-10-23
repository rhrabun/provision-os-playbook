# Provision OS Playbook

Ansible playbook which automates system configuration

# Profiles

Each host declares a `profile` in the inventory:

| profile | OS | connection | use |
|---|---|---|---|
| `personal` | macOS | local | personal machine |
| `dev` | macOS or Linux | local | development-only machine |
| `server` | Linux (apt) | remote | remote server |

`personal` and `dev` share the dev tooling; `personal` adds personal GUI apps,
`server` adds hardening and installs no GUI.

Inventory groups describe location: `local` (the machine Ansible runs on) and
`servers` (remote). The `profile` host var decides what gets installed.

# How-To:
Run `make` or `make help` for help message

Refer to Makefile for details on dependencies installation or playbook execution

> Make sure to copy `example.inventory.yml` to `inventory.yml` and change the username.
