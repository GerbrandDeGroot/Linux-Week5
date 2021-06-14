base:
  'ubuntuserver8':
    - install_filebeat
    - install_metricbeat
    - metricbeat_module_docker
    - metricbeat_restart
    - install_munin_node
    - install_docker
  'ubuntuserver9':
    - install_filebeat
    - install_metricbeat
    - metricbeat_module_mysql
    - metricbeat_module_apache
    - metricbeat_restart
    - install_munin_node
    - install_wordpress
