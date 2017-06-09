#!/bin/bash

# supprimer le répertoire /volumes/ramdisk (si Xcode a été lancé sans appeler ce script d'abord)

rm -rf /Volumes/ramdisk

# créer un RAM disk de 4 Go. Le monter comme /Volumes/ramdisk
# Si /Volumes/ramdisk existe déjà, ne rien faire

if [[ $(mount | awk '$3 == "/Volumes/ramdisk" {print $3}') != "" ]]; then
	echo /Volumes/ramdisk est monté
else
	# 1.2 Go
	#diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://2500000`

	# 640 Mo
	diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://1250000`
fi

open -a Xcode
