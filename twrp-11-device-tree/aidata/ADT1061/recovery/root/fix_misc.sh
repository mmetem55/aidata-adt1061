#!/sbin/sh
dd if=/dev/zero of=/dev/block/platform/soc/soc:ap-apb/71400000.sdio/by-name/misc bs=256 count=1 conv=notrunc
