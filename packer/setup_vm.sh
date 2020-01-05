
#!/bin/sh

set -ex

if [ `id -u` -ne 0 ]; then
     sudo $0
    exit 0
fi
sudo mkdir /test_2020
sudo yum install wget unzip git -y
sudo wget https://releases.hashicorp.com/vault-ssh-helper/0.1.4/vault-ssh-helper_0.1.4_linux_amd64.zip
sudo unzip vault-ssh-helper_0.1.4_linux_amd64.zip
sudo mv vault-ssh-helper /usr/local/bin/
sudo rm -rf vault-ssh-helper_0.1.4_linux_amd64.zip
sudo cd /opt
sudo git clone https://gitlab.com/ycy1766/openstack_devops_2019.git
sudo cp -aR openstack_devops_2019/packer/packer_for_sshd/config.hcl /opt
sudo cp -aR openstack_devops_2019/packer/packer_for_sshd/sshd /etc/pam.d/sshd
sudo cp -aR   openstack_devops_2019/packer/packer_for_sshd/sshd_config  /etc/ssh/sshd_config
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
