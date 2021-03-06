# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

#### Public Classes

* [`observium`](#observium): A short summary of the purpose of this class

#### Private Classes

* `observium::apache`: Class: observium::apache inherits observium  Configure apache server with virtual host for observium
* `observium::config`: Class: observium::config  Configure observium configuration files
* `observium::database_init`: Class: obversium  Init the observium database after install.
* `observium::firewalld`: Class: observium::firewall  Manages firewall and opens ports for observium
* `observium::firewallufw`: Class: observium::firewallufw  Manage UFW on ubuntu
* `observium::install`: Class: observium::install  Creates folder structure for Observium, and install from tar
* `observium::mariadb`: Class: observium::mariadb  Install mysql or mariadb - OS dependant
* `observium::packages`: Class: observium::packages  Installs required packges for observium
* `observium::selinux`: Class: observium::selinux  Class disables selinux as per observium install guide.
* `observium::snmp`: Class: observium::snmp  Sets up SNMP locally to permit monitoring of local host out of the box.
* `observium::yum`: Creates requried yumrepo for RHEL and installs GPG keys.

## Classes

### `observium`

Observium base class which accepts parameters to customise the observium install.

#### Examples

##### 

```puppet
include observium
```

#### Parameters

The following parameters are available in the `observium` class.

##### `db_password`

Data type: `String`

Mysql password for observium user - default 'changeme'

##### `rootdb_password`

Data type: `String`

Mysql root password - default 'hello123'

##### `download_url`

Data type: `String`

Url to the installer, IE http://observium.com/, can be a file path - default 'http://www.observium.org/'

##### `installer_name`

Data type: `String`

Installer name, IE observium-installer.tar - default 'observium-community-latest.tar.gz'

##### `db_host`

Data type: `String`

Database host to use - default 'localhost'

##### `db_user`

Data type: `String`

Database user to use - default 'observium'

##### `community`

Data type: `String`

Default SNMP community to configure - default 'puppet'

##### `snmpv3_authlevel`

Data type: `Enum['noAuthNoPriv','authNoPriv','authPriv']`

Default SNMP authlevel to use - default 'authPriv'
Valid options - ['noAuthNoPriv','authNoPriv','authPriv']

##### `snmpv3_authname`

Data type: `String`

SNMP Authname SNMPv3 user - default 'observium'

##### `snmpv3_authpass`

Data type: `String[8]`

Auth password - min 8 character

##### `snmpv3_authalgo`

Data type: `Enum['SHA','MD5']`

Auth algorithm - defualt 'SHA'
Valid options - ['SHA','MD5']

##### `snmpv3_cryptopass`

Data type: `String[8]`

Crypto pass - min 8 character

##### `snmpv3_cryptoalgo`

Data type: `Enum['AES','DES']`

Crypto algorithm - default 'AES'
Valid options - ['AES','DES']

##### `fping_location`

Data type: `String`

Change if fping is in a non default locaiton - default, RHEL '/sbin/fping' Ubuntu '/usr/bin/fping'

##### `email_default`

Data type: `String`

Not setup yet, use additional config option to setup email default

##### `email_from`

Data type: `String`

Not setup yet, use additional config option to setup email from

##### `admin_password`

Data type: `String`

Admin password for the default admin observium user - default 'changeme'

##### `apache_bind_ip`

Data type: `String`

Bind IP address - default $facts['ipaddress']

Default value: `$facts['ipaddress']`

##### `apache_hostname`

Data type: `String`

Apache hostname for observium site - default $facts['hostname']

Default value: `$facts['hostname']`

##### `apache_port`

Data type: `String`

Apache non SSL port - note if SSL is enabled this will have no effect - default '80'

##### `apache_sslport`

Data type: `String`

Apache SSL port - note if SSL isn't enable this will have no effect - defautl '443'

##### `custom_ssl_cert`

Data type: `String`

Path to SSL certificate, note this module will automatically create a cert in this location '/etc/ssl/observium_cert.pem' - default '/etc/ssl/observium_cert.pem'

##### `custom_ssl_key`

Data type: `String`

Path to SSL certificate key, note this module will automatically create a key in this location '/etc/ssl/observium_key.pem' - default '/etc/ssl/observium_key.pem'

##### `manage_repo`

Data type: `Boolean`

Manage repo, RHEL only, - default true

##### `manage_selinux`

Data type: `Boolean`

Manage selinux, RHEL only. This will set selinux to permissive mode as observium havn't published a selinux profile - default true

##### `manage_fw`

Data type: `Boolean`

Manage firewalld on RHEL. UFW on ubuntu. - default RHEL true, Ubuntu false

##### `manage_snmp`

Data type: `Boolean`

Configure snmpd on the observium and add to observium - default true

##### `manage_mysql`

Data type: `Boolean`

Install and configure mysql, - default true

##### `manage_apache`

Data type: `Boolean`

Install and configure Apache, - defalt true

##### `manage_apachephp`

Data type: `Boolean`

Configure Apachemod php, - default true

##### `manage_ssl`

Data type: `Boolean`

Setup the web site as SSL. If no cert provided, a self signed one will be used. - default false

##### `repos`

Data type: `Optional[Hash]`

Customise repoistory locations for RedHat

Default value: ``undef``

##### `gpgkeys`

Data type: `Optional[Hash]`

Customise GPG keys for RedHat

Default value: ``undef``

##### `observium_additional_conf`

Data type: `Optional[Array]`

Array of additional configurations options to add to /opt/observium/config.php

Default value: ``undef``
