# resize-raspberry-pi-centos
A short and sweet CentOS 7 script to expand the root directory on Raspberry Pi's. As the script (/usr/local/bin/rootfs-expand) referenced on the (CentOS Wiki)(https://wiki.centos.org/SpecialInterestGroup/AltArch/Arm32#head-61f4a64fb0c44b1080d87dd0c618ed4d0c8ef8df) does not exist on recent CentOS ARM builds.

You may or may not have mixed results.

# Requirements
growpart

Install with "yum install growpart" on CentOS.
