# Class: nginx
# ===========================

class nginx(
  String $ensure,
  String $package_name,
  String $config_ensure,
  String $config_directory,
  String $config_mode,
  String $config_owner,
  String $config_group,
  String $config_confd,
  String $config_log_dir,
  String $config_pid_file,
  String $service_ensure,
  String $service_name,
  String $service_pattern,
  Boolean $service_enable,
  Boolean $service_hasstatus,
  Boolean $service_hasrestart,
  String $docroot,
  Optional[String] $vdir_enable,
  String $process_user,
  String $vhost_dir,
) {
  class { '::nginx::install': }
  -> class { '::nginx::config': }
  ~> class { '::nginx::service': }
}
