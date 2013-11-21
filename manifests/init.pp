# Class: cronlock
#
# This module manages serf
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class cronlock (
  $grace_time     = $::cronlock::params::grace_time,
  $release_time   = $::cronlock::params::release_time,

  $redis_host     = $::cronlock::params::redis_host,
  $redis_port     = $::cronlock::params::redis_port,
  $prefix         = $::cronlock::params::prefix,
  $key            = $::cronlock::params::global_key,

  $verbose        = $::cronlock::params::verbose,
  $ntpdate        = $::cronlock::params::ntpdate,
  $timeout        = $::cronlock::params::timeout,


  $install_path   = $::cronlock::params::install_path,
  $owner          = $::cronlock::params::owner,
  $group          = $::cronlock::params::group
) inherits cronlock::params
{

  include install
  include config

  Class['install'] ->
  Class['config']
}
