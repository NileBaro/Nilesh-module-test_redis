require 'spec_helper'

os = ENV['BEAKER_set'] ||= 'centos6'

case os
when /default/
  osversion = '6'
when /centos6/
  osversion = '6'
when /centos7/
  osversion = '7'
else
  raise "Operating system: #{os} is not supported"
end

describe 'redistest' do

  include_context "hieradata"
  include_context "facter"

  context 'supported operating systems' do
    describe "redistest class without any parameters on CentOS #{osversion}" do
      let(:params) {{ }}
      let(:facts) do
        default_facts.merge({
        :operatingsystemmajrelease => osversion,
        })
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('redistest') }
      it { is_expected.to contain_class('redistest::params') }

      it { is_expected.to contain_class('redistest::install').that_comes_before('redistest::config') }
      it { is_expected.to contain_class('redistest::config') }
      it { is_expected.to contain_class('redistest::service').that_subscribes_to('redistest::config') }


      ## Amend as appropriate
      # it { is_expected.to contain_service('redistest') }
      # it { is_expected.to contain_package('redistest').with_ensure('present') }

    end
  end

end
