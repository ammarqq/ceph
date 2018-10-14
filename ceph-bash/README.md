How to use:

1- Install OS and configure the IPs of the servers.(Ubuntu 16.04.2/3).

2- Add host names to /etc/hosts on all your servers if they are not puplished on DNS.

3- Copy the file "cephconfig.sh" to your machine if it can reach the ceph servers or to ceph admin node.

4- Change the permission of file using: chmod +x cephconfig.sh

5- Run the file and follow the instructions: ./cephconfig.sh


Note: The script is configured to use:

- 3 Ceph Admin servers

- 3 Ceph Monitors

- 6 Ceph Osds
