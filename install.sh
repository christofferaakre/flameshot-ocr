#!/usr/env/bash
# install script for flameshot-cr
# chmod +x this script and then run it: ./install.sh

# installing dependencies
sudo apt install -y flameshot
sudo apt install -y xdotool
python 3 -m pip install manga_ocr
