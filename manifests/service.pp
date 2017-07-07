class nginx::service inherits nginx {
  
  service { 'nginx_service': 
    ensure     => $service_ensure,
    name       => $service_name,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
    pattern    => $service_pattern,
  }
  
}
