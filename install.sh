#!/usr/env/bash
# install script for flameshot-ocr
# chmod +x this script and then run it: ./install.sh

# installing dependencies
sudo apt install -y flameshot
sudo apt install -y xdotool
python3 -m pip install manga_ocr