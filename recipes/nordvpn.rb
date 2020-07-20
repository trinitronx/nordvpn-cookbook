# frozen_string_literal: true

#
# Cookbook:: nordvpn
# Recipe:: nordvpn
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

# <
# Install `nordvpn` via Linux [`.deb` package install method](https://nordvpn.com/download/linux/).
# >

nordvpn_config = node['nordvpn']

if nordvpn_config['deb_package_url'].nil? || nordvpn_config['deb_package_url'].empty?
  deb_package = File.join(Chef::Config['file_cache_path'], 'nordvpn-release_1.0.0_all.deb')
  deb_package_url = 'https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb'
  remote = deb_package_url
else
  remote = nordvpn_config['deb_package_url']
end

remote_file deb_package do
  source remote
  owner 'root'
  group 'root'
  mode '0755'
  checksum nordvpn_config['deb_package_checksum'] || '16a05919b7259e679e4483aa39f61ef9bc9c07cbe040276e04884b5f9d7f933d'
end

package 'nordvpn' do
  version nordvpn_config['version'] if !nordvpn_config['version'].nil? && !nordvpn_config['version'].empty?
  action :install
end

