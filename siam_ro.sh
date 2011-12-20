#!/sbin/sh
#
# ./siam   version: 1.2
# Created by: Daniel J Griffiths
# Support: Contact Ghost1227 on MIUI.us
# Maintained by: iinga on #miui-us on Freenode
# System Identification And Mounting script
#

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
    mount -o ro,remount /dev/block/mtdblock2 /system
    ;;
### TYPE 2
  bravo|inc|leo|passion)
    mount -o ro,remount /dev/block/mtdblock3 /system
    ;;
### TYPE 3
  supersonic|sholes)
    mount -o ro,remount /dev/block/mtdblock4 /system
    ;;
### TYPE 4
  umts_sholes)
    mount -o ro,remount /dev/block/mtdblock6 /system
    ;;
### TYPE 5
  p999|p990)
    mount -o ro,remount /dev/block/mmcblk0p1 /system
    ;;
### TYPE 6
  encore)
    mount -o ro,remount /dev/block/mmcblk0p5 /system
    ;;
### TYPE 7
  shooter)
    mount -o ro,remount /dev/block/mmcblk0p23 /system
    ;;
### TYPE 8
  ace|saga|vision|viviow|vivo|glacier)
    mount -o ro,remount /dev/block/mmcblk0p25 /system
    ;;
### TYPE 9
  speedy)
    mount -o ro,remount /dev/block/mmcblk0p26 /system
    ;;
### TYPE 10
  umts_jordan|cdma_droid2|cdma_shadow)
    mount -o ro,remount /dev/block/mmcblk1p21 /system
    ;;
### TYPE 11
  crespo|crespo4g)
    mount -o ro,remount /dev/block/platform/s3c-sdhci.0/by-name/system /system
    ;;
### TYPE 12
  galaxys2)
    mount -o ro,remount /dev/block/mmcblk0p9 /system
	;;
### TYPE 13
  pyramid)
    mount -o ro,remount /dev/block/mmcblk0p22 /system
	;;
### FAILSAFE
  *)
    echo "Your device is not supported." > /data/siams_error.log
    echo "Please email iinga at iinga.net" > /data/siams_error.log
    echo "  with the following info:" > /data/siams_error.log
    echo "" > /data/siams_error.log
    echo "Device: $(getprop ro.product.device)" > /data/siams_error.log
    echo "System: $(mount | grep system | cut -d ' ' -f 1)" > /data/siams_error.log
    exit 1
esac