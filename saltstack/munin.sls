munin:
  # Install munin
  # 
  pkg.installed:
    - pkgs:
      - munin 
      - munin-node

  # Install master configuration file
  # (we want to adjust some directories)
  #
  file.managed:
    - name: /etc/munin/munin.conf
    - source: salt://files/munin.conf


# Create directory for web content
#
munin.apache.dir:
  file.directory:
    - name: /var/www/html/munin
    - user: munin
    - group: www-data
    - mode: 755
    - makedirs: True
    - require:
      - pkg: apache2


# Disable munins default configuration for apache
munin.apache.disabled:
  file.absent:
    - name: /etc/apache2/conf-enabled/munin.conf
