#!/system/bin/sh
  echo 1 > /sys/module/sec/parameters/recovery_done
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:10222892:2d19edc8e0a71b085e72960538b425cd3bc8d138; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:9309480:f0d8f37a1b8ed133dcb9ed9ebcd574a1484a123f EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 2d19edc8e0a71b085e72960538b425cd3bc8d138 10222892 f0d8f37a1b8ed133dcb9ed9ebcd574a1484a123f:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  if applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:10222892:2d19edc8e0a71b085e72960538b425cd3bc8d138; then
        echo 0 > /sys/module/sec/parameters/recovery_done
        log -t recovery "Install new recovery image completed"
        
  if applysig /system/etc/recovery.sig recovery; then
    sync
    log -t recovery "Apply recovery image signature completed"
  else
    log -t recovery "Apply recovery image signature fail!!"
  fi
  
  else
        echo 2 > /sys/module/sec/parameters/recovery_done
        log -t recovery "Install new recovery image not completed"
  fi
else
  echo 0 > /sys/module/sec/parameters/recovery_done
  log -t recovery "Recovery image already installed"
fi
