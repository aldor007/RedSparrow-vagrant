#!/bin/bash

ANSIBLE_DIR=$1
ANSIBLE_PLAYBOOK=$2
ANSIBLE_HOSTS=$3
TEMP_HOSTS="/tmp/ansible_hosts"
echo 'LANG="pl_PL.UTF-8"' > /etc/default/locale
echo 'LANG="pl_PL.UTF-8"' > /etc/default/locale
cp /vagrant/windows/locale.gen  /etc/locale.gen
locale-gen pl_PL.utf8
if [ ! -f /vagrant/$ANSIBLE_PLAYBOOK ]; then
	echo "Cannot find Ansible playbook"
	exit 1
fi

if [ ! -f /vagrant/$ANSIBLE_HOSTS ]; then
	echo "Cannot find Ansible hosts ${ANSIBLE_HOSTS}"
	exit 2
fi

if [ ! -d $ANSIBLE_DIR ]; then
    cp /vagrant/windows/sources.list /etc/apt/sources.list 
	echo "Updating apt cache"
	apt-get update
	echo "Installing Ansible dependencies and Git"
	apt-get install -y git python-yaml python-paramiko python-jinja2 python-pip
	echo  "Installing Ansible"
    pip install ansible
fi

cd ${ANSIBLE_DIR}
cp /vagrant/${ANSIBLE_HOSTS} ${TEMP_HOSTS} && chmod -x ${TEMP_HOSTS}
echo "Running Ansible"
bash -c "ansible-playbook /vagrant/${ANSIBLE_PLAYBOOK} --inventory-file=${TEMP_HOSTS} --connection=local -u vagrant"
rm ${TEMP_HOSTS}
