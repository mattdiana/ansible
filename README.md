# Connected House Ansible Configuration

Ansible configuration for the Connected House.

[![Ansible Lint](https://github.com/connected-house/ansible/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/connected-house/ansible/actions/workflows/ansible-lint.yml)

- [Installation](#installation)
  * [Git](#git)
  * [Secrets](#secrets)
  * [Galaxy Requirements](#galaxy-requirements)
- [License](#license)

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
export BW_SESSION=$(bw unlock --raw)
```

### Galaxy Requirements

This repository makes use of collections and roles loaded in from [Ansible Galaxy](https://galaxy.ansible.com/). These are described in `requirements.yml` and can be installed by running:

```
ansible-galaxy install -r requirements.yml
```

## License

This project is open source and available under the [MIT License](LICENSE).

Inventory configuration is stored separately in a private Git submodule referenced at `./inventory/` and is not available publicly.
