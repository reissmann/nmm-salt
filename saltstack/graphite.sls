graphite:
  # Just to be sure, we need packages from universe
  # 
#  pkgrepo.managed:
#    - humanname: Ubuntu
#    - name: deb http://archive.ubuntu.com/ubuntu trusty main universe
#    - dist: trusty
#    - file: /etc/apt/sources.list.d/trusty_univers.list

  # Install graphite
  # 
  pkg.installed:
    - pkgs:
      - graphite-web 
      - graphite-carbon
      - libapache2-mod-wsgi

  # Configure graphites internal userdatabase
  # 
  cmd.run:
    - name: graphite-manage syncdb --noinput
    - cwd: /
    - creates: /var/lib/graphite/graphite.db

  # Set correct access rights for graphite db
  # 
  file.managed:
    - name: /var/lib/graphite/graphite.db
    - user: _graphite
    - group: _graphite


# Enable carbon
graphite.carbon:
  file.managed:
    - name: /etc/default/graphite-carbon
    - source: salt://files/graphite.carbon.conf

  service.running:
    - name: carbon-cache
    - enable: True


# We need wsgi to run graphite-web
#
graphite.apache.modules:
  apache_module.enable:
    - name: wsgi
    - require:
      - pkg: graphite
      - pkg: apache2


# We want port 8000 to be enabled
#
graphite.apache.ports:
  file.managed:
    - name: /etc/apache2/ports.conf
    - source: salt://files/apache.ports.conf
    - require:
      - pkg: apache2


# Install and enable the graphite vhost
#
graphite.apache.vhost:
  file.managed:
    - name: /etc/apache2/sites-available/graphite.conf
    - source: salt://files/graphite.apache.conf
    - require:
      - pkg: apache2


# Enable the graphite vhost
#
graphite.apache.vhost.enable:
  file.symlink:
    - name: /etc/apache2/sites-enabled/graphite.conf
    - target: /etc/apache2/sites-available/graphite.conf
    - require:
      - pkg: apache2
