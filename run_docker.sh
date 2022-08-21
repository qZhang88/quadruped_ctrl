# start docker container
docker run -it \
    --env="DISPLAY=$IP:0" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="/Users/zq/Desktop/Projects/Robot/Quadruped/quadruped_mpc_ctrl:/root/catkin_ws/src/quadruped_ctrl"
    --privileged \
    --network host \
    --name ros-desktop \
    quad
