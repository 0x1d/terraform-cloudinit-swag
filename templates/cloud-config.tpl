#cloud-config

users:
  - name: root
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/bash
package_upgrade: true
packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg-agent
  - software-properties-common
  - docker.io
  - docker-compose
runcmd:
  - bash ${app_context}/run.sh
write_files:
  - path: ${app_context}/run.sh
    encoding: b64
    owner: root:root
    permissions: '0750'
    content: |
      ${runcmd}
  - path: ${app_context}/docker-compose.yaml
    encoding: b64
    owner: root:root
    permissions: '0750'
    content: |
      ${compose_file}
