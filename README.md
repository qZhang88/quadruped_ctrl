# quadruped_robot

### MIT mini cheetah simulation in pybullet
MIT mini cheetah use customized simulator and lcm framework, which is not a popular way to do the robot development. Now, we extract the algorithm and do the simulation using ros and pybullet. This can be simple to deploy the system into different custom robot or plantform, and easy to learn the algorithm.

<img src="quadruped_balance.gif" alt="show" />
<img src="vision.png" alt="show" />
<img src="rviz.png" alt="show" />

### System requirements:
Ubuntu 20.04, ROS Noetic

### Dependency:

Clone all three repos under same directory with this repo.

```bash
# use Logitech gamepad to control robot
git clone https://github.com/Derek-TH-Wang/gamepad_ctrl.git

# msg rospack and rviz plugin
git clone https://github.com/loco-3d/whole_body_state_msgs.git
git clone https://github.com/eborghi10/whole_body_state_rviz_plugin.git
```

### Run

We run this inside a docker container.

**Start docker**

Build docker image and start container.
```bash
cd docker
docker build -t ros-desktop .

xhost +
./run_docker.sh
```

**Build**
```bash
docker attach

cd {your workspace}
catkin make
source devel/setup.bash
```

#### Install Python dependencies

```bash
pip3 install -r requirements.txt
```

### Terrain
you can modify the ```config/quadruped_ctrl_cinfig.yaml/terrain``` to deploy different terrains, there are four terrains supported in the simulator now, for example:
```
"plane"
"stairs"
"random1"
"random2"
"racetrack"
```

### Running:
run the gamepad node to control robot:
```
roslaunch gamepad_ctrl gamepad_ctrl.launch
```
run the controller in simulator:
```
roslaunch quadruped_ctrl quadruped_ctrl.launch
```

switch the camera on / off:
camera set ```True``` or ```False``` in ```config/quadruped_ctrl_config.yaml```, then launch the rviz to see the point cloud:
```
roslaunch quadruped_ctrl vision.launch
```

also can switch the gait type:
```
rosservice call /gait_type "cmd: 1"
```

gait type:
```
0:trot
1:bunding
2:pronking
3:random
4:standing
5:trotRunning
6:random2
7:galloping
8:pacing
9:trot (same as 0)
10:walking
11:walking2
```

