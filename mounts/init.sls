{%- set mounts = salt.pillar.get('mounts', {}) %}

{%- for name, opts in mounts.get('mounted', {}).items() %}

# Use this script until Salt Carbon release as `blockdev.formatted` hangs
# waiting for user input if device is not a partition
# https://github.com/saltstack/salt/issues/31033
# https://github.com/abednarik/salt/commit/30b9690ea87c551138cbf88c9e67b69405be693d

  {%- if opts.get('format') %}
mounts-format-{{ name }}:
  cmd.script:
    - name: salt://mounts/files/safe-format
    - args: {{ opts.get('device') }}
    - stateful: True
    - require_in:
        mount: mounts-mount-{{ name }}
  {%- endif %}

mounts-mount-{{ name }}:
  mount.mounted:
    - name: {{ opts.get('name') }}
    - device: {{ opts.get('device') }}
    - fstype: {{ opts.get('fstype', 'ext4') }}
    - mkmnt: {{ opts.get('mkmnt', False) }}
    - opts: {{ opts.get('opts', 'defaults') }}
    - dump: {{ opts.get('dump', '0') }}
    - pass_num: {{ opts.get('pass_num', '0') }}
    - config: {{ opts.get('config', '/etc/fstab') }}
    - persist: {{ opts.get('persist', True) }}
    - mount: {{ opts.get('mount', True) }}
    - user: {{ opts.get('user', 'root') }}
    - match_on: {{ opts.get('match_on', 'auto') }}
    - order: 1
{%- endfor %}

{%- for name, opts in mounts.get('unmounted', {}).items() %}
mounts-unmounted-{{ name }}:
  mount.unmounted:
    - name: {{ opts.get('name') }}
    - device: {{ opts.get('device') }}
    - config: {{ opts.get('config', '/etc/fstab') }}
    - persist: {{ opts.get('persist', False) }}
    - user: {{ opts.get('user', 'root') }}
{%- endfor %}
