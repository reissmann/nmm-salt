# Install a job to the saltstack scheduler, 
# which pushes the results of munin-run to carbon
#
salt:
  file.managed:
    - name: /etc/salt/minion.d/carbon.conf
    - source: salt://files/salt.carbon.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: munin
      - pkg: graphite
