#!/bin/bash

echo "Enter this device's IP address (laptop): (without http:// or port)"
echo "    (if running this in a VM, enter the guest computer's IP)"
echo "    (find IP using 'hostname -I')"
read MyIP

echo "Enter the robots's IP address (Jetson): (without http:// or port)"
read RobotIP

source /opt/ros/melodic/setup.bash

if [ -f "devel/setup.bash" ]; then
    # echo "Sourcing devel/setup.bash"
    source devel/setup.bash
elif [ -f "devel_isolated/setup.bash" ]; then
    # echo "Sourcing devel_isolated/setup.bash"
    source devel_isolated/setup.bash
else
    echo "Could not find a ROS setup.bash file! ROS commands may not work."
fi


export ROS_MASTER_URI=http://$RobotIP:11311
export ROS_IP=$MyIP
unset ROS_HOSTNAME # Setting both ROS_IP and ROS_HOSTNAME isn't necessary and it might cause problems if they're different

echo "Done."
