require 'spec_helper'

describe 'cronlock::cron' do
  let(:title) { 'test' }
  context 'with defaults' do
    it { should include_class('cronlock') }
    it { should contain_cron('test').with_ensure('present') }
    it { should contain_cron('test').with_command(/(.*)\/cronlock /) }
    it { should contain_cron('test').with_command(//) }
  end
  context 'with prefix' do
    let(:params){ {:prefix=> 'app1'} }
  end
end
