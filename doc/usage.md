1. Bootstrap Chef Infra Client on a node.
  - For example: `/usr/local/bin/knife bootstrap  --connection-user ubuntu --ssh-identity-file ~/.ssh/id_rsa --sudo  --ssh-verify-host-key accept_new --host example.local`
2. Create a role for your NordVPN host, and include the recipes for it.

For example, to install:

- NordVPN version `1.2.3` from official NordVPN APT repository

```ruby
name "nordvpn-host"
description "Role for NordVPN hosts"
default_attributes 'nordvpn' => {
    'version' => '1.2.3',
  }
run_list [ "nordvpn::nordvpn" ]
```
