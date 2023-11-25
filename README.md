# Klipper Hybrid CoreXY Kinematic

# Install
```
cd ~/
git clone https://github.com/HelgeKeck/klipper_hybrid_corexy.git
bash ~/klipper_hybrid_corexy/install.sh
```

# Moonraker Update Manager
- add the update manager entry to the moonraker.conf file in your config folder
```ini
[update_manager IDEX]
type: git_repo
primary_branch: main
path: ~/vcore-idex
origin: https://github.com/HelgeKeck/vcore-idex.git
managed_services:
	klipper
```

# Activate
```ini
[hybrid_corexy]
inverted: true
```
