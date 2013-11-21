define cronlock::cron(
  $ensure       = 'present',
  $prefix       = $::cronlock::prefix,

# Default cron paramaters
  $command      = $name,
  $environment  = undef,
  $hour         = undef,
  $minute       = undef,
  $month        = undef,
  $monthday     = undef,
  $provider     = undef,
  $special      = undef,
  $target       = undef,
  $user         = undef,
  $weekday      = undef
){

  include cronlock

  cron{$name:
    ensure        =>  $ensure,
    command       =>  "${cronlock::install_path}/cronlock ${command}",
    environment   =>  $environment,
    hour          =>  $hour,
    minute        =>  $minute,
    month         =>  $month,
    monthday      =>  $monthday,
    provider      =>  $provider,
    special       =>  $special,
    target        =>  $target,
    user          =>  $user,
    weekday       =>  $weekday
  }
}
