include redis
include cronlock

cronlock::cron{'test':
  command =>  'ls -shalt > ~/test 2>&1'
}
