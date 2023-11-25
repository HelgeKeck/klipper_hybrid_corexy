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

# Inverted Hybrid CoreXY Kinematic
```ini
[hybrid_corexy]
inverted: true
```

# Motor Configurations
Single Toolhead A Motor
```ini
stepper_x
stepper_y
stepper_y1
```

Single Toolhead AB Motor
```ini
stepper_x
stepper_x1
stepper_y
stepper_y1
```

IDEX 
```ini
stepper_x
dual_carriage
stepper_y
stepper_y1
```

IDEX AWD
```ini
stepper_x
stepper_x1
dual_carriage
dual_carriage1
stepper_y
stepper_y1
stepper_y2
stepper_y3
```
