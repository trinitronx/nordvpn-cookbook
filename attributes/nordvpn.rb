# frozen_string_literal: true

#
# Cookbook:: nordvpn
# Recipe:: nordvpn
# Attribute:: nordvpn
# Author:: James Cuzella
#
# Copyright:: © 🄯 2020,  James Cuzella
# License:: GPLv3.0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# <> The download URL for the `.deb` APT repo package file from [NordVPN Linux Downloads](https://nordvpn.com/download/linux/).
default['nordvpn']['deb_package_url'] = 'https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb'
# <> The SHA256 checksum of the `.deb` APT repo package file.
default['nordvpn']['deb_package_checksum'] = '16a05919b7259e679e4483aa39f61ef9bc9c07cbe040276e04884b5f9d7f933d'
# <> The version of the `nordvpn` APT package to install. Defaults to empty `String`, and installs latest APT package available.
default['nordvpn']['version'] = ''

