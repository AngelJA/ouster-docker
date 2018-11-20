This repo provides a Dockerfile which builds Ouster's example code (https://github.com/ouster-lidar/ouster_example) and uses it to vizualize a bag file in rviz.

I have tested this on Ubuntu Bionic Beaver.

run using the provided run script: `./run.sh`

requires:
- docker: https://docs.docker.com/install/linux/docker-ce/ubuntu/
- nvidia-docker1: https://github.com/NVIDIA/nvidia-docker/tree/1.0 
    - can be modified to work without nvidia-docker, or with nvidia-docker2
    - or on newer versions of Ubuntu (after Xenial): https://github.com/AngelJA/nvidia-docker