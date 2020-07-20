# frozen_string_literal: true

#
# Cookbook:: nordvpn
# Recipe:: default
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

# ChefSpec test for recipe nordvpn::nordvpn

# The ChefSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/workstation/chefspec/

require 'spec_helper'

describe 'nordvpn::nordvpn' do
  context 'When all attributes are default, on Ubuntu 20.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '20.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'installs nordvpn' do
      expect(chef_run).to install_package('nordvpn')
    end
  end

  context 'When version set to 1.2.3 on Ubuntu 20.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '20.04'
    let(:nordvpn_version) { '1.2.3' }
    let(:deb_package) { File.join(Chef::Config['file_cache_path'], 'nordvpn-release_1.0.0_all.deb') }
    let(:deb_package_url) { 'https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb' }
    let(:deb_package_checksum) { '16a05919b7259e679e4483aa39f61ef9bc9c07cbe040276e04884b5f9d7f933d' }
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '20.04') do |node|
        node.normal['nordvpn']['version'] = nordvpn_version
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'adds nordvpn APT repo via deb package' do
      expect(chef_run).to create_remote_file(deb_package).with(checksum: deb_package_checksum, source: deb_package_url, owner: 'root', group: 'root', mode: '0755')
      expect(chef_run).to install_dpkg_package('nordvpn-release').with(source: deb_package)
    end

    it 'installs nordvpn' do
      expect(chef_run).to install_package('nordvpn').with(
        version: nordvpn_version
      )
    end
  end

  context 'When custom url & checksum set on Ubuntu 20.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '20.04'
    let(:deb_package) { File.join(Chef::Config['file_cache_path'], 'nordvpn-release_1.2.3_all.deb') }
    let(:deb_package_url) { 'https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.2.3_all.deb' }
    # Checksum of 'abc'
    let(:deb_package_checksum) { 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad' }

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '20.04') do |node|
        node.normal['nordvpn']['deb_package_url'] = deb_package_url
        node.normal['nordvpn']['deb_package_checksum'] = deb_package_checksum
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'adds nordvpn APT repo via deb package' do
      expect(chef_run).to create_remote_file(deb_package).with(checksum: deb_package_checksum, source: deb_package_url, owner: 'root', group: 'root', mode: '0755')
      expect(chef_run).to install_dpkg_package('nordvpn-release').with(source: deb_package)
    end

    it 'installs nordvpn' do
      expect(chef_run).to install_package('nordvpn')
    end
  end
end
