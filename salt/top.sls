base:
  'ubuntuserver14':
    - install_filebeat
    - install_metricbeat
    - metricbeat_module_docker
    - metricbeat_restart
    - install_munin_node
    - install_docker
    - configure_rsyslog

  'ubuntuserver15':
    - install_filebeat
    - filebeat_module_apache
    - install_metricbeat
    - metricbeat_module_apache
    - metricbeat_restart
    - install_munin_node
    - install_wordpress
    - configure_rsyslog
