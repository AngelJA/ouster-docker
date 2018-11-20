FROM ros:kinetic-ros-core-xenial

RUN apt update && apt install -y \
    ros-kinetic-pcl-ros \
    ros-kinetic-rqt-common-plugins \
    ros-kinetic-rviz

# nvidia-docker hooks
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# build ouster code
ADD ws root/ws
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; cd ~/ws; catkin_make"

# run rviz, bag gui, and ouster node
CMD /bin/bash -c "source ~/ws/devel/setup.bash; roslaunch ouster_ros play_bag.launch"