Facter.add(:is_zabbixserver) do
  confine :kernel => 'Linux'
  setcode do
    if File.exist? '/etc/zabbix/zabbix_server.conf'
      'zabbix-server'
    else
      'not zabbix-server' 
    end
  end
end

