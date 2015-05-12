#
# Copyright (C) 2015 Red Hat
#
# Author: Emilien Macchi <emilien@redhat.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

require 'spec_helper'

describe 'oslo::messaging::rabbit' do

  let (:title) { 'nova_config' }

  let :required_params do
    { :rabbit_userid   => 'nova',
      :rabbit_password => 'secret',
      :rabbit_hosts    => ['rabbit:5673', 'rabbit2:5674'] }
  end

  shared_examples 'shared examples' do

    context 'with some parameters' do
      let :params do
        required_params
      end

      it { is_expected.to contain_nova_config('oslo_messaging_rabbit/rabbit_userid').with(
        :value  => 'nova',
      )}
      it { is_expected.to contain_nova_config('oslo_messaging_rabbit/rabbit_password').with(
        :value  => 'secret',
        :secret => true,
      )}
      it { is_expected.to contain_nova_config('oslo_messaging_rabbit/rabbit_hosts').with(
        :value  => 'rabbit:5673,rabbit2:5674',
      )}
    end

  end

  context 'on a Debian osfamily' do
    let :facts do
      { :osfamily => "Debian" }
    end

    include_examples 'shared examples'
  end

  context 'on a RedHat osfamily' do
    let :facts do
      { :osfamily => 'RedHat' }
    end

    include_examples 'shared examples'
  end
end
