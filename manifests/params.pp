class cronlock::params{

  $grace_time     = ''
  $release_time   = ''

  $redis_host     = 'localhost'
  $redis_port     = '6379'
  $prefix         = 'cronlock'
  $key            = ''

  $verbose        = 'no'
  $ntpdate        = 'no'
  $timeout        = '0'

  $install_url    = 'https://raw.github.com/kvz/cronlock/master/cronlock'
  $install_path   = '/usr/local/bin'
  $owner          = 'root'
  $group          = 'root'

}
