class nginx::config inherits nginx {
  
  file { 'nginx_configuration': 
    ensure       => $config_ensure,
    path         => "${config_directory}/nginx.conf",
    mode         => $config_mode,
    owner        => $owner,
    group        => $group,
    content      => template("${module_name}/conf.d/nginx.conf.erb"),
  }
  
}
