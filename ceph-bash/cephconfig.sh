#Templates ready, IP Ready, Hosts Ready, Hostname Ready, Connected to Internet
admn1=$admn1
admn2=$admn2
admn3=$admn3
mon1=$mon1
mon2=$mon2
mon3=$mon3
stg1=$stg1
stg2=$stg2
stg3=$stg3
stg4=$stg4
stg5=$stg5
stg6=$stg6
rootuserpass=$rootuserpass
cephosuserpass=$cephosuserpass
echo "please enter ceph admin 1 hostname"
read admn1
echo "please enter ceph admin 2 hostname"
read admn2
echo "please enter ceph admin 3 hostname"
read admn3
echo "please enter ceph monitor 1 hostname"
read mon1
echo "please enter ceph monitor 2 hostname"
read mon2
echo "please enter ceph monitor 3 hostname"
read mon3
echo "please enter ceph OSD 1 hostname"
read stg1
echo "please enter ceph OSD 2 hostname"
read stg2
echo "please enter ceph OSD 3 hostname"
read stg3
echo "please enter ceph OSD 4 hostname"
read stg4
echo "please enter ceph OSD 5 hostname"
read stg5
echo "please enter ceph OSD 6 hostname"
read stg6
echo "please enter root user password"
read rootuserpass
echo "please enter cephos user password"
read cephosuserpass

sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$admn1 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$admn2 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect-y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$admn3 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$mon1 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$mon2 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$mon3 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg1 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg2 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg3 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg4 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg5 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg6 << EOF
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-jewel/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
dpkg --configure -a
apt-get update && sudo apt-get install ceph-deploy -y
apt-get install ntp openssh-server sshpass expect -y
ufw disable
echo "driftfile /var/lib/ntp/ntp.drift
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable
server infra01 iburst
pool ntp.ubuntu.com
restrict -4 default kod notrap nomodify nopeer noquery limited
restrict -6 default kod notrap nomodify nopeer noquery limited
restrict 127.0.0.1
restrict ::1
restrict source notrap nomodify noquery
" > /etc/ntp.conf
service ntp restart; ntpq -cpe -cas
hostname
useradd -d /home/cephos -m cephos
echo "cephos ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephos
echo cephos:$cephosuserpass | chpasswd
chmod 0440 /etc/sudoers.d/cephos
exit
EOF

su - cephos << EOF
hostname
ssh-keygen -t rsa -N "" -f /home/cephos/.ssh/id_rsa
exit
EOF
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$admn2
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$admn3
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$mon1
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$mon2
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$mon3
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$stg1
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$stg2
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$stg3
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$stg4
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$stg5
sshpass -p "$cephosuserpass" ssh-copy-id -i /home/cephos/.ssh/id_rsa cephos@$stg6
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg1 << EOF
parted -s /dev/sdb mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdc mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdd mklabel gpt mkpart primary 0% 32% mkpart primary 33% 66% mkpart primary 67% 100%
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg2 << EOF
parted -s /dev/sdb mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdc mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdd mklabel gpt mkpart primary 0% 32% mkpart primary 33% 66% mkpart primary 67% 100%
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg3 << EOF
parted -s /dev/sdb mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdc mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdd mklabel gpt mkpart primary 0% 32% mkpart primary 33% 66% mkpart primary 67% 100%
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg4 << EOF
parted -s /dev/sdb mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdc mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdd mklabel gpt mkpart primary 0% 32% mkpart primary 33% 66% mkpart primary 67% 100%
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg5 << EOF
parted -s /dev/sdb mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdc mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdd mklabel gpt mkpart primary 0% 32% mkpart primary 33% 66% mkpart primary 67% 100%
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg6 << EOF
parted -s /dev/sdb mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdc mklabel gpt mkpart primary 0% 24% mkpart primary 25% 49% mkpart primary 50% 74% mkpart primary 75% 100%
parted -s /dev/sdd mklabel gpt mkpart primary 0% 32% mkpart primary 33% 66% mkpart primary 67% 100%
exit
EOF
su - cephos << EOF
mkdir cluster
cd cluster
ceph-deploy new $mon1 $mon2 $mon3
echo '
#Added By Team
osd_pool_default_size = 3
osd_max_object_name_len = 256
osd_max_object_namespace_len = 64
osd pool default min size = 0
osd pool default pg num = 512
osd pool default pgp num = 512
osd pool default crush rule = 1
osd crush chooseleaf type = 1
#osd crush update on start = false
[mon]
	mon host = $mon1, $mon2, $mon3
	mon addr =  $mon1, $mon2, $mon3

[mon.$mon1]
	host = $mon1
	mon addr = $mon1:6789

[mon.$mon2]
	host = $mon2
	mon addr = $mon2:6789

[mon.$mon3]
	host = $mon3
	mon addr = $mon3:6789
	
mon initial members = $mon1, $mon2, $mon3
	
[osd]
	cluster network = 10.102.2.0/24
	public network = 10.102.1.0/24

[osd.18]
	host = $stg1
	public addr = $stg1
	cluster addr = $stg1-priv

[osd.19]
	host = $stg1
	public addr = $stg1
	cluster addr = $stg1-priv

[osd.20]
	host = $stg1
	public addr = $stg1
	cluster addr = $stg1-priv

[osd.21]
	host = $stg2
	public addr = $stg2
	cluster addr = $stg2-priv

[osd.22]
	host = $stg2
	public addr = $stg2
	cluster addr = $stg2-priv

[osd.23]
	host = $stg2
	public addr = $stg2
	cluster addr = $stg2-priv

[osd.24]
	host = $stg3
	public addr = $stg3
	cluster addr = $stg3-priv

[osd.25]
	host = $stg3
	public addr = $stg3
	cluster addr = $stg3-priv

[osd.26]
	host = $stg3
	public addr = $stg3
	cluster addr = $stg3-priv

[osd.27]
	host = $stg4
	public addr = $stg4
	cluster addr = $stg4-priv

[osd.28]
	host = $stg4
	public addr = $stg4
	cluster addr = $stg4-priv

[osd.29]
	host = $stg4
	public addr = $stg4
	cluster addr = $stg4-priv

[osd.30]
	host = $stg5
	public addr = $stg5
	cluster addr = $stg5-priv

[osd.31]
	host = $stg5
	public addr = $stg5
	cluster addr = $stg5-priv

[osd.32]
	host = $stg5
	public addr = $stg5
	cluster addr = $stg5-priv

[osd.33]
	host = $stg6
	public addr = $stg6
	cluster addr = $stg6-priv

[osd.34]
	host = $stg6
	public addr = $stg6
	cluster addr = $stg6-priv

[osd.35]
	host = $stg6
	public addr = $stg6
	cluster addr = $stg6-priv
' >> ceph.conf
ceph-deploy install $admn1 $admn2 $admn3 $mon1 $mon2 $mon3 $stg1 $stg2 $stg3 $stg4 $stg5 $stg6
ceph-deploy mon create-initial
ceph-deploy osd create $stg1:/dev/sde:/dev/sdb1
ceph-deploy osd create $stg1:/dev/sdf:/dev/sdb2
ceph-deploy osd create $stg1:/dev/sdg:/dev/sdb3
ceph-deploy osd create $stg2:/dev/sde:/dev/sdb1
ceph-deploy osd create $stg2:/dev/sdf:/dev/sdb2
ceph-deploy osd create $stg2:/dev/sdg:/dev/sdb3
ceph-deploy osd create $stg3:/dev/sde:/dev/sdb1
ceph-deploy osd create $stg3:/dev/sdf:/dev/sdb2
ceph-deploy osd create $stg3:/dev/sdg:/dev/sdb3
ceph-deploy osd create $stg4:/dev/sde:/dev/sdb1
ceph-deploy osd create $stg4:/dev/sdf:/dev/sdb2
ceph-deploy osd create $stg4:/dev/sdg:/dev/sdb3
ceph-deploy osd create $stg5:/dev/sde:/dev/sdb1
ceph-deploy osd create $stg5:/dev/sdf:/dev/sdb2
ceph-deploy osd create $stg5:/dev/sdg:/dev/sdb3
ceph-deploy osd create $stg6:/dev/sde:/dev/sdb1
ceph-deploy osd create $stg6:/dev/sdf:/dev/sdb2
ceph-deploy osd create $stg6:/dev/sdg:/dev/sdb3
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg1 << EOF
chown ceph:ceph /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4 /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc4 /dev/sdd1 /dev/sdd2 /dev/sdd3
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg2 << EOF
chown ceph:ceph /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4 /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc4 /dev/sdd1 /dev/sdd2 /dev/sdd3
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg3 << EOF
chown ceph:ceph /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4 /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc4 /dev/sdd1 /dev/sdd2 /dev/sdd3
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg4 << EOF
chown ceph:ceph /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4 /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc4 /dev/sdd1 /dev/sdd2 /dev/sdd3
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg5 << EOF
chown ceph:ceph /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4 /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc4 /dev/sdd1 /dev/sdd2 /dev/sdd3
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg6 << EOF
chown ceph:ceph /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4 /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc4 /dev/sdd1 /dev/sdd2 /dev/sdd3
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdb
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 4:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdc
sudo sgdisk -t 1:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 2:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
sudo sgdisk -t 3:45B0969E-9B03-4F30-B4C6-B4B80CEFF106 /dev/sdd
exit
EOF
su - cephos << EOF
cd cluster
ceph-deploy disk zap $stg1:sde $stg1:sdf $stg1:sdg
ceph-deploy disk zap $stg2:sde $stg2:sdf $stg2:sdg
ceph-deploy disk zap $stg3:sde $stg3:sdf $stg3:sdg
ceph-deploy disk zap $stg4:sde $stg4:sdf $stg4:sdg
ceph-deploy disk zap $stg5:sde $stg5:sdf $stg5:sdg
ceph-deploy disk zap $stg6:sde $stg6:sdf $stg6:sdg
ceph-deploy osd create $stg1:sde:/dev/sdb1 $stg1:sdf:/dev/sdb2 $stg1:sdg:/dev/sdb3
ceph-deploy osd create $stg2:sde:/dev/sdb1 $stg2:sdf:/dev/sdb2 $stg2:sdg:/dev/sdb3
ceph-deploy osd create $stg3:sde:/dev/sdb1 $stg3:sdf:/dev/sdb2 $stg3:sdg:/dev/sdb3
ceph-deploy osd create $stg4:sde:/dev/sdb1 $stg4:sdf:/dev/sdb2 $stg4:sdg:/dev/sdb3
ceph-deploy osd create $stg5:sde:/dev/sdb1 $stg5:sdf:/dev/sdb2 $stg5:sdg:/dev/sdb3
ceph-deploy osd create $stg6:sde:/dev/sdb1 $stg6:sdf:/dev/sdb2 $stg6:sdg:/dev/sdb3
ceph-deploy --overwrite-conf admin $admn1 $admn2 $admn3 $mon1 $mon2 $mon3 $stg1 $stg2 $stg3 $stg4 $stg5 $stg6
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$admn1 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$admn2 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$admn3 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$mon1 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$mon2 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$mon3 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg1 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg2 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg3 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg4 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg5 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
sshpass -p "$rootuserpass" ssh -o StrictHostKeyChecking=no root@$stg6 << EOF
chmod +r /etc/ceph/ceph.client.admin.keyring
exit
EOF
su - cephos << EOF
cd cluster
ceph osd pool set rbd pg_num 512
ceph osd pool set rbd pgp_num 512
ceph osd getcrushmap -o crush-compiled-original
echo "# begin crush map
tunable choose_local_tries 0
tunable choose_local_fallback_tries 0
tunable choose_total_tries 50
tunable chooseleaf_descend_once 1
tunable chooseleaf_vary_r 1
tunable straw_calc_version 1

# devices
device 18 osd.18
device 19 osd.19
device 20 osd.20
device 21 osd.21
device 22 osd.22
device 23 osd.23
device 24 osd.24
device 25 osd.25
device 26 osd.26
device 27 osd.27
device 28 osd.28
device 29 osd.29
device 30 osd.30
device 31 osd.31
device 32 osd.32
device 33 osd.33
device 34 osd.34
device 35 osd.35

# types
type 0 osd
type 1 host
type 2 chassis
type 3 rack
type 4 row
type 5 pdu
type 6 pod
type 7 room
type 8 datacenter
type 9 region
type 10 root

# buckets
host $stg1 {
        id -2           # do not change unnecessarily
        # weight 3
        alg straw
        hash 0  # rjenkins1
        item osd.18 weight 1
        item osd.19 weight 1
        item osd.20 weight 1
}
host $stg2 {
        id -3           # do not change unnecessarily
        # weight 3
        alg straw
        hash 0  # rjenkins1
        item osd.21 weight 1
        item osd.22 weight 1
        item osd.23 weight 1
}
host $stg3 {
        id -4           # do not change unnecessarily
        # weight 13
        alg straw
        hash 0  # rjenkins1
        item osd.24 weight 1
        item osd.25 weight 1
        item osd.26 weight 1
}
host $stg4 {
        id -5           # do not change unnecessarily
        # weight 3
        alg straw
        hash 0  # rjenkins1
        item osd.27 weight 1
        item osd.28 weight 1
        item osd.29 weight 1
}
host $stg5 {
        id -6           # do not change unnecessarily
        # weight 3
        alg straw
        hash 0  # rjenkins1
        item osd.30 weight 1
        item osd.31 weight 1
        item osd.32 weight 1
}
host $stg6 {
        id -7           # do not change unnecessarily
        # weight 3
        alg straw
        hash 0  # rjenkins1
        item osd.33 weight 1
        item osd.34 weight 1
        item osd.35 weight 1
}
rack RAC2 {
                id -8           # do not change unnecessarily
                # weight 6
                alg straw
                hash 0  # rjenkins1
                item $stg1 weight 3
                item $stg2 weight 3
}
rack RAC3 {
                id -9           # do not change unnecessarily
                # weight 6
                alg straw
                hash 0  # rjenkins1
                item $stg3 weight 3
                item $stg4 weight 3
}
rack RAC5 {
                id -10           # do not change unnecessarily
                # weight 6
                alg straw
                hash 0  # rjenkins1
                item $stg5 weight 3
                item $stg6 weight 3
}
datacenter HO {
                id -11           # do not change unnecessarily
                # weight 12
                alg straw
                hash 0  # rjenkins1
                item RAC2 weight 6
                item RAC3 weight 6
}
datacenter HA {
                id -12           # do not change unnecessarily
                # weight 6
                alg straw
                hash 0  # rjenkins1
                item RAC5 weight 6
}
region Amman {
                id -13           # do not change unnecessarily
                # weight 18
                alg straw
                hash 0  # rjenkins1
                item HO weight 12
                item HA weight 6
}
root default {
        id -1           # do not change unnecessarily
        # weight 18
        alg straw
        hash 0  # rjenkins1
        item Amman weight 18
}

# rules
rule PSROLE {
        ruleset 1
        type replicated
        min_size 1
        max_size 3
        step take default
        step chooseleaf firstn 0 type rack
        step emit
}
# end crush map

" > crush-decompiled
crushtool -c crush-decompiled -o crush-compiled
ceph osd setcrushmap -i  crush-compiled
ceph osd pool create images 512
sudo ceph auth get-or-create client.images mon 'allow r' osd 'allow class-read object_prefix rbd_children, allow rwx pool=images' -o /etc/ceph/ceph.client.images.keyring
ceph osd pool create volumes 512
sudo ceph auth get-or-create client.volumes mon 'allow r' osd 'allow class-read object_prefix rbd_children, allow rwx pool=volumes, allow rx pool=images' -o /etc/ceph/ceph.client.volumes.keyring
ceph osd pool create vms 512
sudo ceph auth get-or-create client.nova mon 'allow r' osd 'allow class-read object_prefix rbd_children, allow rwx pool=vms, allow rwx pool=volumes, allow rx pool=images' -o /etc/ceph/ceph.client.nova.keyring
ceph osd pool delete rbd rbd --yes-i-really-really-mean-it
ceph osd rm 0
ceph osd rm 1
ceph osd rm 2
ceph osd rm 3
ceph osd rm 4
ceph osd rm 5
ceph osd rm 6
ceph osd rm 7
ceph osd rm 8
ceph osd rm 9
ceph osd rm 10
ceph osd rm 11
ceph osd rm 12
ceph osd rm 13
ceph osd rm 14
ceph osd rm 15
ceph osd rm 16
ceph osd rm 17
exit
EOF
