#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:12409088:05f63882ca5d44f277f539828aea554c8908528f; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:10082560:803c4eacf965426ca988f48c182e35ca81052bab EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 05f63882ca5d44f277f539828aea554c8908528f 12409088 803c4eacf965426ca988f48c182e35ca81052bab:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
