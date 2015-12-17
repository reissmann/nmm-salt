grafana:
  # Add grafana package repo
  #
  pkgrepo.managed:
    - humanname: Grafana
    - name: deb https://packagecloud.io/grafana/stable/debian/ wheezy main
    - dist: wheezy
    - file: /etc/apt/sources.list.d/grafana.list
    - key_url: https://packagecloud.io/gpg.key
    - require:
      - pkg: apt-transport-https

  # Install grafana
  #
  pkg.installed:
    - name: grafana

  # Run grafana
  # 
  service.running:
    - name: grafana-server 
    - enable: True
