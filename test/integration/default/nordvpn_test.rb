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

# InSpec test for recipe nordvpn::nordvpn

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

# test_driver = input('test_driver')
version = input('version')
version_regexp = Regexp.new(version.to_s, Regexp::IGNORECASE | Regexp::MULTILINE)

describe command('nordvpn --version') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(version_regexp) } if !version.nil? && !version.empty?
end

control 'nordvpn installed' do
  impact 'critical'
  title 'Check if NordVPN works'
  desc 'Check nordvpn is working.'

  # No need to skip... these tests work in docker / Dokken
  # only_if('Integration tests are NOT running in Dokken') do
  #   test_driver != 'dokken'
  # end

  describe file('/usr/bin/nordvpn') do
    it { should exist }
    its('type') { should eq :file }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0755' }
  end

  describe systemd_service('nordvpnd') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end
