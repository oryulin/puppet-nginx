define nginx::vhost(
  Integer $port = 80,
  String $priority = '50',
  String $server_aliases = '',
  Boolean $enable = true,
) {
   
  include nginx
  
  file { "${vhost_dir}/${priority}-${name}.conf": 
    ensure    => file,
    content   => template("${module_name}/vhost/vhost.conf.erb"),
    mode      => $config_mode,
    owner     => $config_owner,
    group     => $config_group,
    notifyi   => Service['nginx_service'],
  }
  
}
