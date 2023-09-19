#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:12407040:363616e3b04035a78b2261d34d87c1404ae221eb; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:10080512:2d1ffeac8543775756ba69f6bfe44e2d75f68eaf EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 363616e3b04035a78b2261d34d87c1404ae221eb 12407040 2d1ffeac8543775756ba69f6bfe44e2d75f68eaf:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
