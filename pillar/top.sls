{{ saltenv }}:
  salt-master.linode.rbkmoney.dev:
    - gentoo.makeconf.default
    - gentoo.arch.linode
    - salt.minion
    - salt.master
