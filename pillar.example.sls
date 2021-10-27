mounts:
  mounted:
    # Format and mount
    minimum:
      name: /mnt
      device: /dev/sdb
      format: True
      mkmnt: True         # Default is False, True used for testing
    # All options
    all_opts:
      name: /data
      device: /dev/sdc
      format: True        # Default is False, True used for testing
      fstype: ext4
      mkmnt: True         # Default is False, True used for testing
      # opts and hidden_opts can be either directly a list, or a string that
      # will be split on commas
      opts: defaults
      hidden_opts:
      # async is hidden on at least some nfs mounts
      - async
      dump: 0
      pass_num: 0
      config: /etc/fstab
      persist: True
      mount: True
      user: root
      match_on: auto
      order: 1            # Makes sure to run first in highstate order incase you forget requisites
  unmounted:
    foo:
      name: /mnt/blah
      device: /dev/sde
      config: /etc/fstab
      persist: True       # Default is False, True used for testing
      user: root

