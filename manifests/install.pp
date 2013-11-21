class cronlock::install{

  exec{'install_cronlock':
    command =>  "curl -q ${::cronlock::install_url} -o ${::cronlock::install_path}/cronlock",
    path    =>  '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/sbin:/sbin',
    creates =>  "${::cronlock::install_path}/cronlock",
    user    =>  $::cronlock::owner,
    group   =>  $::cronlock::group
  }->
  file{"${::cronlock::install_path}/cronlock":
    owner =>  $::cronlock::owner,
    group =>  $::cronlock::group,
    mode  =>  '0755'
  }

}
