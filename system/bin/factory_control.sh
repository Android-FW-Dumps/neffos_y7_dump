#!/system/bin/sh
##############################################################################
#
# Copyright (C), 2016, TP-LINK TECHNOLOGIES CO., LTD.
#
# Filename: factory_control.sh
#
# Author: Fengyunliang
#
# Mail : fengyunliang@tp-link.com.cn
#
# Description: use to control lcmbacklight, led, quickcharger
#
# Last modified: 2016-10-17 9:36
#
##############################################################################
value=`getprop sys.factory_control.value`
type=`getprop sys.factory_control.type`
tp_product=`getprop ro.product.tp_product`

lcd_backlight_dev_node="sys/class/leds/lcd-backlight/brightness"
breath_leds_enable_dev_node="/sys/bus/platform/drivers/breath-leds/enable"
breath_leds_mode_dev_node="/sys/bus/platform/drivers/breath-leds/mode"
breath_leds_step_dev_node="/sys/bus/platform/drivers/breath-leds/step"
breath_leds_dimDutyRed_dev_node="/sys/bus/platform/drivers/breath-leds/dimDutyRed"
breath_leds_dimDutyGreen_dev_node="/sys/bus/platform/drivers/breath-leds/dimDutyGreen"
quick_charger_vbus_dev_node="/sys/devices/platform/battery/Pump_Express_20_Vbus"

if [ $type == "lcd-backlight" ] ; then
    echo $value > $lcd_backlight_dev_node
elif [ $type == "breath-leds" ] ; then
    if [ $tp_product == "tp913" ] ; then
        echo "0" > $breath_leds_mode_dev_node
        echo "0" > $breath_leds_step_dev_node
        echo "18" > $breath_leds_dimDutyRed_dev_node
        echo "9" > $breath_leds_dimDutyGreen_dev_node
        echo $value > $breath_leds_enable_dev_node
    else
        echo "0" > $breath_leds_mode_dev_node
        echo "0" > $breath_leds_step_dev_node
        echo "5" > $breath_leds_dimDutyRed_dev_node
        echo "7" > $breath_leds_dimDutyGreen_dev_node
        echo $value > $breath_leds_enable_dev_node
    fi
elif [ $type == "quick-charger" ] ; then
    if [ $tp_product == "tp903" ] ; then
        echo $value > $quick_charger_vbus_dev_node
    fi
else
    echo "factory_control no match"
fi
