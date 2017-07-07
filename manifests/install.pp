class nginx::install inherits nginx {
  
  package { 'install_nginx':
    ensure => $ensure,
    name   => $package_name,
  }  
  
} 
