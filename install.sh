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
KLIPPY_KINEMATICS="${HOME}/klipper/klippy/kinematics"

function start_klipper {
    sudo systemctl restart klipper
}

function stop_klipper {
    if [ "$(sudo systemctl list-units --full -all -t service --no-legend | grep -F "klipper.service")" ]; then
        sudo systemctl stop klipper
    else
        echo "Klipper service not found, please install Klipper first."
        exit 1
    fi
}

function link_klippy_kinematics {
    if [ -d "${KLIPPY_KINEMATICS}" ]; then
        rm -f "${KLIPPY_KINEMATICS}/hybrid_corexy.py"
        ln -sf "${SRCDIR}/klippy/kinematics/hybrid_corexy.py" "${KLIPPY_KINEMATICS}/hybrid_corexy.py"
    else
        echo -e "ERROR: ${KLIPPY_KINEMATICS} not found, please install Klipper first."
        exit 1
    fi
}

echo -e "Hybrid CoreXY Kinematic"
stop_klipper
link_klippy_kinematics
start_klipper
echo -e ""
echo -e "Installation finished!"
echo -e ""
exit 0
