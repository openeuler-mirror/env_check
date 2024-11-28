#!/bin/bash
device=$(findmnt -n -o SOURCE -t ext4,xfs,btrfs | head -n 1)
if [ -z "$device" ]; then echo "No suitable block devices found."; exit 1; fi
echo "Simulating resizing of $device to 10G..."
fsadm --dry-run resize $device 10G
