#!/bin/bash
#
# This script will install Ansible and then deploy Ceph cluster.

# VARIABLES

CEPH_POOL_DEFAULT_SIZE=3				      # Replication level, number of data copies.
CLUSTER_NAME=ceph						        # Ceph Storage Cluster name.
CEPH_RELEASE=jewel						        # Ceph Release.
PUBLIC_ETHERNET_NAME=ens3				    # The Network Interface that will be used for Public Network.
JOURNAL_SIZE_MB=10240					        # The Partition size of the SSD Disks that wil be used for Journal Disk, Each Journal SSD Disk will be partitioned into minimum 5120
PUBLIC_NETWORK_SUBNET=172.16.38.0/24		# The Public Network Interface Subnet.
CLUSTER_NETWORK_SUBNET=172.16.38.0/24	# The Private (Cluster) Network Interface Subnet.
NUMBER_OSD_DISKS=18						        # The available number of OSD Disks physically attached to the Storage server and to be used as OSD Disks Units.
CEPH_POOL_DEFAULT_PG_NUM=$((((NUMBER_OSD_DISKS *20)+(NUMBER_OSD_DISKS *32))/2))		# The Function to calcuate the needed value of PGs to run a Health Cluster.
ROOTPASSWORD=root123					        # The root password for all Ceph servers to configure SSH.

# FUNCTIONS
# The following function will check if Ansible is installed on the used workstation for running this script or not.
function is_ansible_installed {
  if ! command -v ansible-playbook 1&> /dev/null; then
    echo "Please install Ansible"
    exit 1
  fi
}

# The following function will generate a keyring for connecting to all ceph servers without a password.
function ssh_setup {
  if [ ! -f "$HOME"/.ssh/id_rsa ]; then
    echo -e  'y\n'|ssh-keygen -q -t rsa -N "" -f "$HOME"/.ssh/id_rsa
  fi
  if ! grep -Fxq "$(cat "$HOME"/.ssh/id_rsa.pub)" "$HOME"/.ssh/authorized_keys; then
    cat "$HOME"/.ssh/id_rsa.pub >> "$HOME"/.ssh/authorized_keys
  fi
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphmntr01:/root/.
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphmntr02:/root/.
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphmntr03:/root/.
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphstrg01:/root/.
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphstrg02:/root/.
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphstrg05:/root/.
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphstrg06:/root/.
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphstrg09:/root/.
  sshpass -p "$ROOTPASSWORD" scp -rp /root/.ssh root@cphstrg10:/root/.
}

# The following function will populate variable to ansible scripts for building ceph.
function populate_vars {
  sed -i "s/cluster:.*/cluster: ${CLUSTER_NAME}/" group_vars/all.yml
  sed -i "s/ceph_stable_release:.*/ceph_stable_release: ${CEPH_RELEASE}/" group_vars/all.yml
  sed -i "s/monitor_interface:.*/monitor_interface: ${PUBLIC_ETHERNET_NAME}/" group_vars/all.yml
  sed -i "s/journal_size:.*/journal_size: ${JOURNAL_SIZE_MB}/" group_vars/all.yml
  sed -i "s|public_network:.*|public_network: ${PUBLIC_NETWORK_SUBNET}|" group_vars/all.yml
  sed -i "s|cluster_network:.*|cluster_network: ${CLUSTER_NETWORK_SUBNET}|" group_vars/all.yml
  sed -i "s/osd_pool_default_size:.*/osd_pool_default_size: ${CEPH_POOL_DEFAULT_SIZE}/" group_vars/all.yml
  sed -i "s/osd_pool_default_pg_num:.*/osd_pool_default_pg_num: ${CEPH_POOL_DEFAULT_PG_NUM}/" group_vars/all.yml
  sed -i "s/osd_pool_default_pgp_num:.*/osd_pool_default_pgp_num: ${CEPH_POOL_DEFAULT_PG_NUM}/" group_vars/all.yml
}

# The following function will create an inventory_hosts file contains all ceph servers grouped by its Roles; This file will be used by ansible scripts.
function create_inventory {
  cat > inventory_hosts <<EOF
[mons]
cphmntr[01:03]
[osds]
cphstrg01 ceph_crush_root=root ceph_crush_region=Amman ceph_crush_datacenter=HO ceph_crush_rack=RAC2
cphstrg02 ceph_crush_root=root ceph_crush_region=Amman ceph_crush_datacenter=HO ceph_crush_rack=RAC2
cphstrg05 ceph_crush_root=root ceph_crush_region=Amman ceph_crush_datacenter=HO ceph_crush_rack=RAC3
cphstrg06 ceph_crush_root=root ceph_crush_region=Amman ceph_crush_datacenter=HO ceph_crush_rack=RAC3
cphstrg09 ceph_crush_root=root ceph_crush_region=Amman ceph_crush_datacenter=HO ceph_crush_rack=RAC5
cphstrg10 ceph_crush_root=root ceph_crush_region=Amman ceph_crush_datacenter=HO ceph_crush_rack=RAC5
# [mdss]
# cphadmn[01:03]
EOF
}

# The following function will check/test the connectivity to all ceph servers, then if test was success; The installation will continue automatically.
function test_and_run {
  ANSIBLE_HOST_KEY_CHECKING=False ansible all -i inventory_hosts -m ping
  ansible-playbook -i inventory_hosts site.yml
}

is_ansible_installed
ssh_setup
populate_vars
create_inventory
test_and_run
