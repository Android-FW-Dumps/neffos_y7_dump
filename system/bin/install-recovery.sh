#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:12684032:1a2bf267c608337e885337d75882eca14c2e7ed2; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:8956672:f5522043560efc8354441652f880f1f67c518eba EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 1a2bf267c608337e885337d75882eca14c2e7ed2 12684032 f5522043560efc8354441652f880f1f67c518eba:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
