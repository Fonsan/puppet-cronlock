class cronlock::config{

  $configuration = {
    'CRONLOCK_HOST'     =>  $::cronlock::redis_host,
    'CRONLOCK_PORT'     =>  $::cronlock::redis_port,
    'CRONLOCK_GRACE'    =>  $::cronlock::grace_time,
    'CRONLOCK_RELEASE'  =>  $::cronlock::release_time,
    'CRONLOCK_KEY'      =>  $::cronlock::key,
    'CRONLOCK_PREFIX'   =>  $::cronlock::prefix,
    'CRONLOCK_VERBOSE'  =>  $::cronlock::verbose,
    'CRONLOCK_NTPDATE'  =>  $::cronlock::ntpdate,
    'CRONLOCK_TIMEOUT'  =>  $::cronlock::timeout,
  }

  file {'/etc/cronlock.conf':
    owner  => $::cronlock::owner,
    group  => $::cronlock::group,
    mode   => '0644',
    ensure  => present,
    content => inline_template('<%=@configuration.delete_if {|k,v| v==:undef || v.empty? }.sort.map {|k,v| "#{k}=#{v}\n" }%>')
  }

}
