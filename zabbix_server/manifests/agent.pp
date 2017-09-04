class zabbix_server::agent(

  $ip_servagent = '',
) {

  package { 'zabbix-agent':
    ensure  => installed,
    require => Class['zabbix_server::repo'],
  }

  file { '/etc/zabbix/zabbix_agentd.conf':
    ensure  => present,
    content => template('zabbix_server/zabbix_agentd.conf.erb'),
    require => Package['zabbix-agent'],
    notify  => Service['zabbix-agent'],
  }

  service { 'zabbix-agent':
    ensure  => running,
    enable  => true,
    require => File['/etc/zabbix/zabbix_agentd.conf'],
  }

}
