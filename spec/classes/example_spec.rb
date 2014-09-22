require 'spec_helper'

describe 'notifyme' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "notifyme class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('notifyme::params') }
        it { should contain_class('notifyme::install').that_comes_before('notifyme::config') }
        it { should contain_class('notifyme::config') }
        it { should contain_class('notifyme::service').that_subscribes_to('notifyme::config') }

        it { should contain_service('notifyme') }
        it { should contain_package('notifyme').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'notifyme class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('notifyme') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
