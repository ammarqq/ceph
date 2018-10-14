ceph-ansible
============

https://conf.progressoft.com/display/SYSAD/Ceph

Ansible playbook for Ceph!

## What does it do?

This is a custumized Ansible Script to build Ceph Cluster using the below Roles :

* Monitors
* OSDs

## Script Prerequisistes

# Ceph Servers (Monitors & OSDs)

1- Operating System Ready - Ubunut 16.04.2

2- Network should be configured (Public and Private/Cluster Interfaces)

3- Define all Ceph cluster Hosts in /etc/hosts file IF they are not published in DNS.

4- Install the following two Packages :

	- python-dev

	- python-apt

# Client Workstation

1- The following Packages shold be installed at the workstation that will be used for running this Ansible Script:

	- Ansible Package 2.3 or Later

	- sshpass

	- git

2- Define all Ceph cluster Hosts in /etc/hosts file IF they are not published in DNS.

## How To Run

1- Download the Build from the below URL :
```
git clone https://QQQQQ
```
2- Open the File ceph-ansible.sh and modify the following variables to your own :
- Replication level, number of data copies.
	CEPH_POOL_DEFAULT_SIZE (3)
- Ceph Storage Cluster name.
	CLUSTER_NAME (PSceph)
- Ceph Release.
	CEPH_RELEASE (jewel)
- The Network Interface that will be used for Public Network.
	PUBLIC_ETHERNET_NAME (ens33)
- The Partition size of the SSD Disks that wil be used for Journal Disk, Each Journal SSD Disk will be partitioned into minimum 5120
	JOURNAL_SIZE_MB (5120)
- The Public Network Interface Subnet.
	PUBLIC_NETWORK_SUBNET (10.102.1.0/24)
- The Private (Cluster) Network Interface Subnet.
	CLUSTER_NETWORK_SUBNET (10.102.2.0/24)
- The available number of OSD Disks physically attached to the Storage server and to be used as OSD Disks Units.
	NUMBER_OSD_DISKS (18)
- The root password for all Ceph servers to configure the SSH.
	ROOTPASSWORD (root123)

3- Open the File ceph-ansible.sh and modify the hostnames of ceph servers inside ```ssh_setup``` and ```create_inventory``` functions.

4- Open the File group_vars/all.yml and modify the disks paths as below:
- For OSD Disks, go to ```devices:``` section and type the path of your OSD disks.
- For Journal Disks, go to ```dedicated_devices:``` section and type the path of your Journal disks.

5- Run the file ./ceph-ansible.sh
