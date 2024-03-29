{% import 'pkg/common' as pkg %}
include:
  - gentoo.portage.packages
  - gentoo.repos.gentoo
  - gentoo.repos.rbkmoney

sys-apps/portage:
  pkg.latest:
    - reload_modules: True
    - refresh: True
    - pkgs:
      - {{ pkg.gen_atom('sys-apps/portage') }}
    - require:
      - file: gentoo.portage.packages
    # need all repos here since 'refresh' of pkg module is executed once per run
      - file: /etc/portage/repos.conf/gentoo.conf
      - file: /etc/portage/repos.conf/rbkmoney.conf

app-portage-purged:
  pkg.purged:
    - pkgs:
      - app-portage/epkg

/etc/portage/repos.conf/:
  file.directory:
    - mode: 755
    - user: root
    - group: root

/etc/portage/profile/:
  file.directory:
    - create: True
    - mode: 755
    - user: root
    - group: root

/etc/portage/env/:
  file.directory:
    - create: True
    - mode: 755
    - user: root
    - group: root

