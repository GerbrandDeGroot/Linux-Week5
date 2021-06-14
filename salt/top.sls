base:
  'ubuntuserver8':
    - install_filebeat
    - install_metricbeat
    - metricbeat_module_docker
    - install_munin_node
    - install_docker
  'ubuntuserver9':
    - install_filebeat
    - install_metricbeat
    - metricbeat_module_mysql
    - install_munin_node
    - install_wordpress
