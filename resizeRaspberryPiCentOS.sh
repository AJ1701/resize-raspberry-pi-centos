#!/bin/bash
if [ "$EUID" -ne 0 ]
then echo "Please run as root with \"sudo $0\""
	exit
fi

if [ ! -f /usr/bin/growpart ]
then
    echo "growpart is not installed. Run \"yum -y install growpart\" to install it."
	exit
fi

ROOT_DEVICE_FULL_NAME=$(lsblk | grep "/" | grep -v "boot" | sed 's/.*-//g' | awk '{ print $1 }')
DEVICE_BASE_NAME=$(echo ${ROOT_PARTITION::-1})
ROOT_DEVICE_PARTITION_NUMBER=$(echo "${ROOT_PARTITION: -1}")
#echo $ROOT_PARTITION
#echo $DEVICE_NAME
#echo $ROOT_DEVICE_PARTITION_NUMBER
echo "Running sudo growpart /dev/$DEVICE_NAME $ROOT_DEVICE_PARTITION_NUMBER"
sudo growpart /dev/$DEVICE_NAME $ROOT_DEVICE_PARTITION_NUMBER
echo "Running sudo resize2fs /dev/$ROOT_PARTITION"
sudo resize2fs /dev/$ROOT_PARTITION
echo "System will now restart..."
reboot
