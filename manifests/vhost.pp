define nginx::vhost(
  Integer $port = 80,
  String $priority = '50',
  String $server_aliases = '',
  Boolean $enable = true,
) {
   
  include nginx
  
  $vhost_docroot = "${docroot}/${name}"
  
  file { "${vhost_dir}/${priority}-${name}.conf": 
    ensure    => file,
    content   => template("${module_name}/vhost/vhost.conf.erb"),
    mode      => $config_mode,
    owner     => $config_owner,
    group     => $config_group,
    notify    => Service['nginx_service'],
  }
  
  file { $vhost_docroot: 
    ensure    => directory,
    mode      => '0755',
    owner     => $config_owner,
    group     => $config_group,
  }
  
}
