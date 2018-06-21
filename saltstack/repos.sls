# Enable apt over https
#
repo.deps:
  pkg.installed:
    - name: apt-transport-https


# If on Ubuntu, make sure we can pull packets from universe
#
{% if grains.os == 'Ubuntu' %}
repo.universe:
  pkgrepo.managed:
    - humanname: Ubuntu Universe
    - name: deb http://archive.ubuntu.com/ubuntu trusty main universe
    - dist: trusty
    - file: /etc/apt/sources.list.d/universe.list
{% endif %}
