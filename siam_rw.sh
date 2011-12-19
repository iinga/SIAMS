#!/sbin/sh
#
# ./siam   version: 1.2
# Created by: Daniel J Griffiths
# Support: Contact Ghost1227 on MIUI.us
# Maintained by: iinga on #miui-us on Freenode
# System Identification And Mounting script
#

# Supported devices:
#   B&N Nook Color      (encore)
#   Google Nexus One    (passion)
#   Google Nexus S      (crespo)
#   Google Nexus S 4G   (crespo4g)
#   HTC Desire          (bravo)
#   HTC Desire HD       (ace)
#   HTC Desire S        (saga)
#   HTC Desire Z        (vision)
#   HTC EVO 3D          (shooter)
#   HTC EVO 4G          (supersonic)
#   HTC EVO Shift 4G    (speedy)
#   HTC HD2             (leo)
#   HTC Incredible      (inc)
#   HTC Incredible 2    (vivow)
#   HTC Incredible S    (vivo)
#   HTC Sensation       (pyramid)
#   LG G2x              (p999)
#   LG Optimus 2x       (p990)
#   Motorola Defy       (umts_jordan)
#   Motorola Droid      (sholes)
#   Motorola Droid 2    (cdma_droid2)
#   Motorola Droid X    (cdma_shadow)
#   Motorola Milestone  (umts_sholes)
#   Samsung Captivate   (captivatemtd)
#   Samsung Fascinate   (fascinatemtd)
#   Samsung Galaxy S    (galaxysmtd)
#   Samsung Galaxy S II (galaxys2)
#   Samsung Mesmerize   (mesmerizemtd)
#   Samsung Showcase    (showcasemtd)
#   T-Mobile MyTouch 4G (glacier)

# Devices still known to be missing:
#   HTC Desire (CDMA)   (bravoc)
#   Samsung Vibrant     (vibrantmtd)

# Device types:
#   type1:  /dev/block/mtdblock2
#   type2:  /dev/block/mtdblock3
#   type3:  /dev/block/mtdblock4
#   type4:  /dev/block/mtdblock6
#   type5:  /dev/block/mmcblk0p1
#   type6:  /dev/block/mmcblk0p5
#   type7:  /dev/block/mmcblk0p23
#   type8:  /dev/block/mmcblk0p25
#   type9:  /dev/block/mmcblk0p26
#   type10:  /dev/block/mmcblk1p21
#   type11: /dev/block/platform/s3c-sdhci.0/by-name/system
#   type12: /dev/block/mmcblk0p9
#   type13: /dev/block/mmcblk0p22

cdevice=$(cat /system/build.prop | grep 'ro.product.device=' | cut -d '=' -f 2)

case $cdevice in
### TYPE 1
  fascinatemtd|galaxysmtd|mesmerizemtd|showcasemtd|captivatemtd)
    mount -o rw,remount /dev/block/mtdblock2 /system
    ;;
### TYPE 2
  bravo|inc|leo|passion)
    mount -o rw,remount /dev/block/mtdblock3 /system
    ;;
### TYPE 3
  supersonic|sholes)
    mount -o rw,remount /dev/block/mtdblock4 /system
    ;;
### TYPE 4
  umts_sholes)
    mount -o rw,remount /dev/block/mtdblock6 /system
    ;;
### TYPE 5
  p999|p990)
    mount -o rw,remount /dev/block/mmcblk0p1 /system
    ;;
### TYPE 6
  encore)
    mount -o rw,remount /dev/block/mmcblk0p5 /system
    ;;
### TYPE 7
  shooter)
    mount -o rw,remount /dev/block/mmcblk0p23 /system
    ;;
### TYPE 8
  ace|saga|vision|viviow|vivo|glacier)
    mount -o rw,remount /dev/block/mmcblk0p25 /system
    ;;
### TYPE 9
  speedy)
    mount -o rw,remount /dev/block/mmcblk0p26 /system
    ;;
### TYPE 10
  umts_jordan|cdma_droid2|cdma_shadow)
    mount -o rw,remount /dev/block/mmcblk1p21 /system
    ;;
### TYPE 11
  crespo|crespo4g)
    mount -o rw,remount /dev/block/platform/s3c-sdhci.0/by-name/system /system
    ;;
### TYPE 12
  galaxys2)
    mount -o rw,remount /dev/block/mmcblk0p9 /system
	;;
### TYPE 13
  pyramid)
    mount -o rw,remount /dev/block/mmcblk0p22 /system
	;;
### FAILSAFE
  *)
    echo "Your device is not supported." > /dev/tty0
    echo "Please email iinga at iinga.net" > /dev/tty0
    echo "  with the following info:" > /dev/tty0
    echo "" > /dev/tty0
    echo "Device: $(getprop ro.product.device)" > /dev/tty0
    echo "System: $(mount | grep system | cut -d ' ' -f 1)" > /dev/tty0
    exit 1
esac