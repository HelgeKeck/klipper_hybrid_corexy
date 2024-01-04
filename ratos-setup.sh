#!/bin/bash
# Prevent running as root.
if [ ${UID} == 0 ]; then
    echo -e "DO NOT RUN THIS SCRIPT AS 'root'!"
    exit 1
fi
# Force script to exit if an error occurs
set -e

# Find SRCDIR from the pathname of this script
SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ && pwd )"

function register_ratos_kinematics {
    EXT_NAME="ratos_hybrid_corexy"
    EXT_PATH=$(realpath "${SRCDIR}/klippy/kinematics/ratos_hybrid_corexy.py")
    ratos extensions register klipper -k $EXT_NAME "$EXT_PATH"
}

echo -e "Installing RatOS Hybrid CoreXY Kinematic"
register_ratos_kinematics
echo -e "Installation finished!"
exit 0
