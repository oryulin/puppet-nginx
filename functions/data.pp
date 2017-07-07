function nginx::data {
  
  $base_params = {
    'nginx::ensure'                => 'present',
    'nginx::package_name'          => 'nginx',
    'nginx::config_ensure'         => 'file',
    'nginx::config_directory'      => '/etc/nginx',
    'nginx::config_mode'           => '0664',
    'nginx::config_owner'          => 'root',
    'nginx::config_group'          => 'root',
    'nginx::config_confd'          => "${config_dir}/conf.d",
    'nginx::config_log_dir'        => '/var/log/ngingx',
    'nginx::config_pid_file'       => '/run/nginx.pid',	
    'nginx::service_ensure'        => 'running',
    'nginx::service_name'          => 'nginx',
    'nginx::service_pattern'       => 'nginx',
    'nginx::service_enable'        => 'true',
    'nginx::service_hasstatus'     => 'true',
    'nginx::service_hasrestart'    => 'true',
    'nginx::docroot'               => '/usr/share/nginx',
  }
  
  $os_params = $facts['os']['family'] ? {
    'Debian' => { 
      'nginx::vdir_enable'  => "${base_params[nginx::config_directory]}",
      'nginx::process_user' => 'www-data',
      'nginx::vhost_dir'    => "${base_params[nginx::config_directory]}/sites-enabled",
    },
    default  => { 
      'nginx::vdir_enable'  => undef,
      'nginx::process_user' => 'nginx',
      'nginx::vhost_dir'    => "${base_params[nginx::config_confd]}",
    }
  }
  
  $base_params + $os_params
}
