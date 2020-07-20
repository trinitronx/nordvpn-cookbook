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

# InSpec test for recipe lyraphase-docker::nordvpn

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

version = input('version')
version_regexp = Regexp.new(version, Regexp::IGNORECASE | Regexp::MULTILINE)

describe command('nordvpn -v') do
  its('stdout') { should match(/nordvpn version/) }
  its('stdout') { should match(version_regexp) }
end

describe command('dpkg -l nordvpn') do
  its('stdout') { should match(/^ii.*nordvpn.*$/) }
end
