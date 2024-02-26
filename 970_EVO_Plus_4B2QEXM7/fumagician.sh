#!/bin/sh
#This script will be called via /etc/init.d/rcS
/root/fumagician/fumagician 2> /root/fumagician/log

read -n 1 -rs -t 10 -p "Press any key to restart the system ....." input
case $input in
	D)
		echo -e "\n[DebugMode] Enter root as login \n"
		;;
	*)
		/sbin/reboot -f
		;;
esac

