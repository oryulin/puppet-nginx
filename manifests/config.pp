class nginx::config inherits nginx {
  
  file { 'nginx_configuration': 
    ensure       => $config_ensure,
    path         => "${config_directory}/nginx.conf",
    mode         => $config_mode,
    owner        => $owner,
    group        => $group,
    content      => template("${module_name}/conf.d/nginx.conf.erb"),
  }
  
  file { 'nginx_log_directory': 
    ensure       => directory,
    name         => $config_log_dir,
    recurse      => true,
  }
  
  file { 'nginx_doc_root': 
    ensure       => directory,
    name         => $docroot,
    recurse      => true,
    mode         => $config_mode,
    owner        => $owner,
    group        => $group,
  }
}
