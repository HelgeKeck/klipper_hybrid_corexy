#!/bin/bash
# Prevent running as root.
if [ ${UID} == 0 ]; then
    echo -e "DO NOT RUN THIS SCRIPT AS 'root' !"
    echo -e "If 'root' privileges needed, you will prompted for sudo password."
    exit 1
fi

# Force script to exit if an error occurs
set -e

# Default Parameters
BACKUP="${HOME}/klipper_hybrid_corexy_backup"
KINEMATICS="${HOME}/klipper/klippy/kinematics"

function start_klipper {
    sudo systemctl restart klipper
}

function stop_klipper {
    if sudo systemctl list-units --full -all -t service --no-legend | grep -qF "klipper.service"; then
        sudo systemctl stop klipper
    else
        echo "Klipper service not found, please install Klipper first."
        exit 1
    fi
}

function restore_kinematics {
    if [ -d "${KINEMATICS}" ]; then
        if [ -d "${BACKUP}" ]; then
            rm -f "${KINEMATICS}/ratos_hybrid_corexy.py"
            echo -e "RatOS Hybrid CoreXY kinematics uninstalled."
        else
            echo -e "ERROR: ${BACKUP} not found, something went wrong."
            exit 1
        fi
    else
        echo -e "ERROR: ${KINEMATICS} not found, please install Klipper first."
        exit 1
    fi
}

echo -e "Uninstall RatOS Hybrid CoreXY Kinematics"
stop_klipper
restore_kinematics
start_klipper
echo -e ""
echo -e "Restore finished!"
echo -e ""
exit 0
