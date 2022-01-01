# Ansible Configuration

[![Ansible Lint](https://github.com/mattdiana/ansible/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/mattdiana/ansible/actions/workflows/ansible-lint.yml)

This repository contains the Ansible configuration used by Matt & Diana.

## Installation

Ansible must be [installed](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to use this repository.

### Git

Inventory configuration is stored in a private Git submodule. To ensure this is automatically updated, you must enable `submodule.recurse` in the Git configuration:

```
git config --global submodule.recurse true
```

### Secrets

Secrets are stored in [Ansible Vault](https://docs.ansible.com/ansible/latest/cli/ansible-vault.html), the password for which is automatically retrieved from [Bitwarden](https://bitwarden.com/). Ansible uses the [Bitwarden CLI](https://bitwarden.com/help/article/cli/) to access the password, so you'll need to follow the [installation instructions](https://bitwarden.com/help/article/cli/#download-and-install) (credit to [TheOrangeOne](https://theorangeone.net/posts/ansible-vault-bitwarden/) for this approach).

On Windows you can [download the Bitwarden CLI](https://bitwarden.com/help/article/cli/#download-and-install)  but to install the Bitwarden CLI on MacOS, simply run:

```
brew install bitwarden-cli
```

Once it's installed, you'll need to configure it and login with:

```
bw config server <url_of_bitwarden_server>
bw login
```

By default, Bitwarden will prompt you for your password every time you run Ansible. You may alternatively choose to cache your password for the duration of the session by running:

```
./scripts/password_unlock.sh
```

### Galaxy Requirements

This repository makes use of collections and roles loaded in from [Ansible Galaxy](https://galaxy.ansible.com/). These are described in `requirements.yml` and can be installed by running:

```
ansible-galaxy install -r requirements.yml
```

## Usage

### Bootstrapping

One of the benefits of Ansible is that it doesn't require an agent to be run on hosts that you are mananging, but rather relies simply on SSH. So all that's required to manage a host with Ansible is SSH access.

When first creating a host, you can bootstrap it with a privileged user for Ansible using the `bootstrap.yml` playbook:

```
ansible-playbook playbooks/bootstrap.yml
```

The host must already be defined in the inventory file. You will be prompted to enter the name of the host and an existing privileged user to log in with.

## License

This project is open source and available under the [MIT License](LICENSE).

Inventory configuration is stored separately in a private Git submodule referenced at `./inventory/` and is not available publicly.
