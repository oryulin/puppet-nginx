define nginx::vhost(
  Integer $port = 80,
  String $priority = '50',
  String $server_aliases = '',
  Boolean $enable = true,
) {
  
  $docroot = $::nginx::docroot
  $vhost_dir = $::nginx::vhost_dir
  $config_mode = $::nginx::config_mode
  $config_owner = $::nginx::config_owner
  $config_group = $::nginx::config_group

#  include nginx
  
  notify { "Creating the virtual host with data: \n vhost_docroot - ${vhost_docroot} \n vhost_dir - ${vhost_dir} \n priority - ${priority} \n name - ${name} \n mode/owner/group - ${config_mode}/${config_owner}/${config_group}": }
  
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
