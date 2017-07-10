define nginx::vhost(
  Integer $port = 80,
  String $priority = '50',
  String $server_aliases = '',
  Boolean $enable = true,
) {
  
  notify { "Creating the virtual host with data: \n $vhost_docroot - ${vhost_docroot} \n $vhost_dir - ${vhost_dir} \n $priority - ${priority} \n $name - ${name}": }
     
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
    recurse   => true,
    mode      => '0755',
    owner     => $config_owner,
    group     => $config_group,
  }
  
}
