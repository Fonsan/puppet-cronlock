require 'spec_helper'

describe 'cronlock' do
  it { should include_class('cronlock::config') }
  context 'cronlock::config' do
    it { should contain_file('/etc/cronlock.conf') }

    context 'with defailts' do
      it { should contain_file('/etc/cronlock.conf').with({
          :owner  =>  'root',
          :group  =>  'root',
          :mode   =>  '0644',
          :ensure =>  'present'
        })
      }
      it { should contain_file('/etc/cronlock.conf').with_content(/([A-Z]*)=(.*)\n/i)}
      it { should contain_file('/etc/cronlock.conf').with_content(/CRONLOCK_HOST=localhost\n/)}
      it { should contain_file('/etc/cronlock.conf').with_content(/CRONLOCK_PORT=6379\n/)}
      it { should contain_file('/etc/cronlock.conf').with_content(/CRONLOCK_NTPDATE=no\n/)}
      it { should contain_file('/etc/cronlock.conf').with_content(/CRONLOCK_PREFIX=cronlock\n/)}
      it { should contain_file('/etc/cronlock.conf').with_content(/CRONLOCK_TIMEOUT=0\n/)}
      it { should contain_file('/etc/cronlock.conf').with_content(/CRONLOCK_VERBOSE=no\n/)}
    end
    context 'with custom host' do
      let(:params){ {:redis_host=> 'abcdef', :redis_port=> '1234'} }
      it { should contain_file('/etc/cronlock.conf').with_content(/CRONLOCK_HOST=abcdef\n/)}
      it { should contain_file('/etc/cronlock.conf').with_content(/CRONLOCK_PORT=1234\n/)}
    end

  end
end