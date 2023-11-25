# Hybrid CoreXY Kinematic

# Install 
```
cd ~/
git clone https://github.com/HelgeKeck/klipper_hybrid_corexy.git
bash ~/klipper_hybrid_corexy/install.sh
```

# Update
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
