base:
  'ubuntuserver7':
    - install_filebeat
    - install_metricbeat
    - install_munin_node
    - install_docker
  'ubuntuserver8':
    - install_filebeat
    - install_metricbeat
#    - install_munin_node
#    - install_wordpress
