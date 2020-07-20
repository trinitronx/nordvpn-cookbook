# nordvpn
=========

[![Build Status](http://img.shields.io/travis/trinitronx/nordvpn-cookbook.svg)](https://travis-ci.org/trinitronx/nordvpn-cookbook)
[![GitHub Release](https://img.shields.io/github/release/trinitronx/nordvpn-cookbook.svg)](https://github.com/trinitronx/nordvpn-cookbook/releases)
[![LiberaPay](https://img.shields.io/liberapay/patrons/trinitronx.svg?logo=liberapay")](https://liberapay.com/trinitronx/donate)


# Description

Installs `nordvpn` from NordVPN official Apt repository.


# Requirements


- [chef][1] gem (`>= 15.0`)

[1]: https://rubygems.org/gems/chef


## Chef Client:

* chef (>= 15.0) ()

## Platform:

* debian

## Cookbooks:

*No dependencies defined*

# Usage

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


# Attributes

* `node['nordvpn']['deb_package_url']` - The download URL for the `.deb` APT repo package file from [NordVPN Linux Downloads](https://nordvpn.com/download/linux/). Defaults to `https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb`.
* `node['nordvpn']['deb_package_checksum']` - The SHA256 checksum of the `.deb` APT repo package file. Defaults to `16a05919b7259e679e4483aa39f61ef9bc9c07cbe040276e04884b5f9d7f933d`.
* `node['nordvpn']['version']` - The version of the `nordvpn` APT package to install. Defaults to empty `String`, and installs latest APT package available. Defaults to ``.

# Recipes

* [nordvpn::default](#nordvpndefault)
* [nordvpn::nordvpn](#nordvpnnordvpn) - Install `nordvpn` via Linux [`.deb` package install method](https://nordvpn.com/download/linux/).

## nordvpn::default

Add `apt_update` no-op resource for `nordvpn` APT repo installation to notify later

## nordvpn::nordvpn

Install `nordvpn` via Linux [`.deb` package install method](https://nordvpn.com/download/linux/).

# License and Maintainer

Maintainer:: James Cuzella ([@trinitronx][keybase-id])

Source:: https://github.com/trinitronx/nordvpn-cookbook

Issues:: https://github.com/trinitronx/nordvpn-cookbook/issues

License:: GPL-3.0

[keybase-id]: https://gist.github.com/trinitronx/aee110cbdf55e67185dc44272784e694
