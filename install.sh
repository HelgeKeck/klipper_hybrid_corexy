#!/bin/bash
# Prevent running as root.
if [ ${UID} == 0 ]; then
    echo -e "DO NOT RUN THIS SCRIPT AS 'root' !"
    echo -e "If 'root' privileges needed, you will prompted for sudo password."
    exit 1
fi

# Force script to exit if an error occurs
set -e

# Find SRCDIR from the pathname of this script
SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ && pwd )"

# Default Parameters
KINEMATICS="${HOME}/klipper/klippy/kinematics"

function start_klipper {
    sudo systemctl restart klipper
}

function stop_klipper {
    if sudo systemctl list-units --full -all -t service --no-legend | grep -Fq "klipper.service"; then
        sudo systemctl stop klipper
    else
        echo "Klipper service not found, please install Klipper first."
        exit 1
    fi
}

function link_kinematics {
    ln -sf "${SRCDIR}/klippy/kinematics/ratos_hybrid_corexy.py" "${KINEMATICS}/ratos_hybrid_corexy.py"
}

echo -e "Installing RatOS Hybrid CoreXY Kinematics"
stop_klipper
link_kinematics
#git_exclude
start_klipper
echo -e ""
echo -e "Installation finished!"
echo -e ""
exit 0
