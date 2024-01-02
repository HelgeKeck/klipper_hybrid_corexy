# Hybrid CoreXY Kinematic
- Feature complete Hybrid CoreXY Kinematic
- Supports inverted Hybrid CoreXY Kinematic
- Allows probing with both Toolheads for IDEX configurations
- Single toolhead AWD power with an AB motor configuration
- IDEX AWD

# Install 
```
cd ~/
git clone https://github.com/HelgeKeck/klipper_hybrid_corexy.git
bash ~/klipper_hybrid_corexy/install.sh
```

# Uninstall
```
bash ~/klipper_hybrid_corexy/uninstall.sh
```

# RatOS CustomPIOS Integration
```
bash ~/klipper_hybrid_corexy/ratos-update.sh
```

# Update
**moonraker.conf**
```ini
[update_manager Hybrid_CoreXY]
type: git_repo
primary_branch: main
path: ~/klipper_hybrid_corexy
origin: https://github.com/HelgeKeck/klipper_hybrid_corexy.git
managed_services:
	klipper
```

# Inverted Hybrid CoreXY Kinematic
**printer.cfg**
```ini
[printer]
kinematics: ratos_hybrid_corexy

[ratos_hybrid_corexy]
inverted: true
```

# Motor Configurations
Single Toolhead A
```ini
stepper_x
stepper_y
stepper_y1
```

Single Toolhead AB
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
