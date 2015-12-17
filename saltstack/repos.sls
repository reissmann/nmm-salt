# Enable apt over https
#
repo.deps:
  pkg.installed:
    - name: apt-transport-https


# Make sure we can pull packets from universe
#
repo.universe:
  pkgrepo.managed:
    - humanname: Ubuntu Universe
    - name: deb http://archive.ubuntu.com/ubuntu trusty main universe
    - dist: trusty
    - file: /etc/apt/sources.list.d/universe.list
