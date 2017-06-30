#!/bin/bash
pwd=123
echo $pwd | sudo -S add-apt-repository ppa:gns3/ppa
echo $pwd | sudo -S sudo apt-get update
echo $pwd | sudo -S apt-get install -y gns3-gui
