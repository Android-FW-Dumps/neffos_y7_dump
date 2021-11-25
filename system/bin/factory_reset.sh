#!/system/bin/sh
###############################################################################
 #
 # Copyright (C), 2015, TP-LINK TECHNOLOGIES CO., LTD.
 #
 # Filename: factory_reset.sh
 #
 # Author: Jiangtingyu
 #
 # Mail : jiangtingyu@tp-link.net
 #
 # Description: use to reset factory settings
 #
 # Last modified: 2016-01-03 14:34
 #
###############################################################################
/system/bin/rm -f /cache/recovery/command
mkdir -p /cache/recovery/

command_value="--wipe_data\n--reason=factory\n--locale=zh-CN"

for i in 1 2 3
do
    echo "loop $i"
    echo $command_value > /cache/recovery/command
    if [ "`cat /cache/recovery/command`" = "`echo $command_value`" ]
    then
        echo "match"
        break
    fi
done

echo "cat /cache/recovery/command"
cat /cache/recovery/command

setprop persist.sys.factory.reset false
reboot recovery
#/system/bin/am broadcast -a android.intent.action.MASTER_CLEAR
