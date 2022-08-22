#!/system/bin/sh
  echo 1 > /sys/module/sec/parameters/recovery_done
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:10161452:1feabdaf677c2edf579d23d3e5367d9cafeb8b60; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:9245992:8f277a91df6aacda425ee9fc3b4e619761beb475 EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 1feabdaf677c2edf579d23d3e5367d9cafeb8b60 10161452 8f277a91df6aacda425ee9fc3b4e619761beb475:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  if applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:10161452:1feabdaf677c2edf579d23d3e5367d9cafeb8b60; then
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
