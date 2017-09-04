# Developed by Nikita Dolya

1) Module **zabbix_server**
2) Profile **customdb**, **web**, **agent**, **server**
3) Roles **zabbix_master**, **zabbix_agent**
4) **site.pp** lookup classes in **Hiera**
5) all **static data** for profiles lookup in **Hiera**
6) custom fact = **is_zabbixserver** displayed with notify defined 'message' as 'Custom fact = *not zabbix-server*' or 'Custom fact = *zabbix-server*' according to exist of file /etc/zabbix/zabbix_server.conf
6) used **r10k** for deploy production environment
7) try to use **eyaml** (but compile catalog has encrypted data...not resolved yet)
8) use VM's **zabbix**, **puppet**, **hots1** from **Vagrantfile**

# /etc/puppetlabs/puppet/hiera.yaml
```
:backends:
  - eyaml
  - yaml
:logger: console
:eyaml:
  :datadir: "/etc/puppetlabs/code/environments/%{environment}/hieradata"
  :pkcs7_private_key: /etc/puppetlabs/code/environments/%{environment}/keys/private_key.pkcs7.pem
  :pkcs7_public_key: /etc/puppetlabs/code/environments/%{environment}/keys/public_key.pkcs7.pem

:yaml:
  :datadir: "/etc/puppetlabs/code/environments/%{environment}/hieradata"

:hierarchy:
  - "nodes/%{::fqdn}"
  - "secure.eyaml"
  - "common.yaml"
```
# /etc/puppetlabs/r10k/r10k.yaml
```
cachedir: '/var/cache/r10k'

sources:
  mysource:
    remote: 'https://github.com/bubalush/control-repo.git'
    basedir: '/etc/puppetlabs/code/environments/'
```
