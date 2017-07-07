# Class: nginx
# ===========================

class nginx(
  $ensure,
  $package_name,
  $config_ensure,
  $config_directory,
  $config_mode,
  $config_owner,
  $config_group,
  $config_confd,
  $config_log_dir,
  $config_pid_file,
  $service_ensure,
  $service_name,
  $service_pattern,
  $service_enable,
  $service_hasstatus,
  $service_hasrestart,
  $docroot,
  $vdir_enable,
  $process_user,
  $vhost_dir,
) {
  class { '::nginx::install': }
  -> class { '::nginx::config': }
  ~> class { '::nginx::service': }
}
