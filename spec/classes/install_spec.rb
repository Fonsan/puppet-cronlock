require 'spec_helper'

describe 'cronlock::install' do
  context 'with defaults' do
    it do
      should contain_exec('install_cronlock').with({
        'command' =>  'curl -q https://raw.github.com/kvz/cronlock/master/cronlock -o /usr/local/bin/cronlock',
        'creates' =>  '/usr/local/bin/cronlock',
        'user'    =>  'root',
        'group'   =>  'root'
      })
      should contain_file('cronlock_executable').with({
        'path'  =>  "/usr/local/bin/cronlock",
        'owner' =>  'root',
        'group' =>  'root',
        'mode'  =>  '0755'
        })
    end
  end
end
