class nginx::install inherits nginx {
  
  package { 'install_nginx':
    ensure => $ensure,
    package_name => $package_name,
  }  
  
} 
