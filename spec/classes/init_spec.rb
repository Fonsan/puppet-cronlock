require 'spec_helper'

describe 'cronlock' do
  it { should include_class('cronlock::install') }
  it { should include_class('cronlock::config') }
end