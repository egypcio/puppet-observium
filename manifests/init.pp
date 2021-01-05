# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include observium
class observium (
  String $db_password,
  String $rootdb_password,
  String $download_url,
  String $archive_name,
  String $db_host,
  String $db_user,
) {

# Check what OS we are on and install packages
  if $facts['os']['family'] == 'RedHat' {
    include observium::yum
  }

# install required packages
  include observium::packages


# Setup mariadb
  include observium::mariadb

# Install observium binarys 
  include observium::install

# Configure observium
  include observium::config

# order class dependencies. 
Class['observium::yum'] -> Class['observium::packages'] -> Class['observium::mariadb'] -> Class['observium::install'] -> Class['observium::config']
}
