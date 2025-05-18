#!/usr/bin/env bash

BLOCKS=$(lsblk -e 7 -o NAME,TYPE,SIZE,MOUNTPOINT)
ROOT_DISK=
BOOT_DISK=
DATA_DISK=

mount $ROOT_PART /mnt
mount --mkdir $BOOT_PART /mnt/boot
mount --mkdir $DATA_PART /mnt/mnt/data

