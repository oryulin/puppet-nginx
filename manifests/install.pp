class nginx::install inherits nginx {
  
  # Installing pre-req package:
  package { 'install_epel':
    ensure => $ensure,
    name   => 'epel-release',
  }
  
  package { 'install_nginx':
    ensure => $ensure,
    name   => $package_name,
  }  
  
  Package['install_epel'] -> Package['install_nginx']
  
} 
