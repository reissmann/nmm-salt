apache2:
  # Install a webserver
  # (needed to run the graphite ui and api, and to display munin graphs)
  #
  pkg.installed:
    - name: apache2

  # Start the webserver 
  #
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: apache2
    - watch:
      - file: /etc/apache2/*
