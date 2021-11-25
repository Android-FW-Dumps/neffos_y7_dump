#!/system/bin/sh
value=$(cat /sys/board_config/board_config);
setprop persist.board.config ${value}
