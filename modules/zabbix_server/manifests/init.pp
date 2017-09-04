class zabbix_server(

  $urlrepo = 'http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64',
  $keyrepo = 'https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX-A14FE591',
  $userdb = 'zabbix',
  $passdb = 'Zabbix_2017',
  $namedb = 'zabbix',
  $filldb = '/usr/share/doc/zabbix-server-mysql-3.4.1/create.sql.gz',
  $ip_servagent = '127.0.0.1',

) {

  class { 'zabbix_server::zabserver':

    userdb => $userdb,
    passdb => $passdb,
    namedb => $namedb,
    filldb => $filldb,

  }

  class { 'zabbix_server::agent':

    ip_servagent => $ip_servagent,

  }

  class { 'zabbix_server::repo':

    urlrepo => $urlrepo,
    keyrepo => $keyrepo ,

  }

  include firewalld
}
