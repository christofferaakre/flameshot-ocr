# flameshot-ocr
![Demo showing flameshot-ocr in action](video/demo.gif)

`flameshot-ocr` is an open source tool to quickly OCR and look up
text. It will look up text in your yomichan search app, so it
respects all dictionaries/frequency lists etc. that you already have
installed. Fast, lightweight, and uses [manga-ocr](https://github.com/kha-white/manga-ocr)
for OCR.

## Installation
### Linux
1. Clone the repo: `git clone https://github.com/christofferaakre/flameshot-ocr.git`
2. Install dependencies either using the provided `install.sh` script
(if you are on a Debian based distro)
or manually
3. Add the `flameshot-ocr` script to your path, for example by
executing the following commands:
    1. `cd flameshot-ocr`
    2. `sudo ln -s ~/bin/flameshot-ocr flameshot-ocr`
    2. `sudo ln -s ~/bin/yomichan-search yomichan-search`
4. Make sure that you have Yomichan Search set up as  Chrome/chromium app (not just extension)
5. Make sure that you have `Clipboard monitor` turned on in Yomichan Search.
6. Modify the line in the `yomichan-search` script that reads<br>
    `/opt/google/chrome/google-chrome --profile-directory=Default --app-id=dmlhnpobnomcmidkoijomppdlpfkedmi`:
    1. Replace the path to `google-chrome` with the path to your chromium browser if you don't use Google Chrome
    2. Replace the app-id with the app-id for your yomichan search app.
7. Replace the hardoded line `/home/negosaki/bin/yomichan-search` with the absolute
path to the `yomichan-search`, which should be `/home/yourUsername/yomichan-search`
if you followed the instructions above. This path needs to be absolute, not relative
    as otherwise it breaks for ubuntu keyboard shortcuts.
8. Replace the hardcoded `save_path` directory with the absolute path
to the directory that you will monitor with `manga_ocr`

#### Install dependencies using install script:
Note that the install script by default installs
tesseract dependencies specific to japanese; if you
want to use `flameshot-ocr` for a different language, you
will need to change the `tesseract-ocr-jpn` and `tesseract-ocr-jpn-vert`
packages to the correct ones for your target language, or
install these dependencies yourself.
1. `cd flameshot-ocr`
2. `chmod +x install.sh`
3. `sudo ./install.sh`
#### Install dependencies manually:
Install the following dependencies in any way you see fit:
* `manga_ocr` and the required language-specific tesseract packages (`tesseract` need to be in your system path)
* `flameshot` (needs to be in system path)
* `xdotool` (needs to be in system path)
### MacOS
No support currently
### Windows
No suport for running natively on windows currently,
but you can install [WSL (Windows Subsystem for Linux)](https://docs.microsoft.com/en-us/windows/wsl/install)
and install/run the script from there. So, install WSL and then
refer to the Linux installation instructions.
## Why no Windows/MacOS support?
Currently this project is only supported on Linux. The dependencies used are:
* `flameshot` (Windows/MacOS/Linux support)
* `manga_ocr` (Windows/MacOS/Linux support)
* `xdotool` (Only Linux support as far as I am aware)

`xdotool` is only used to focus the yomichan search window so could be
easily be swapped out for Windows/MacOS compatible alternatives.
Also, unix specific paths like `/usr/bin` and `/tmp` are used,
and these do not exist on Windows (although they do on MacOS). However,
this is not too hard to fix, the main problem is not all the dependencies are
supported on Windows/MacOS.

I am not familiar with Windows/MacOS, but if someone else
wants to open a pull request and merge in Windows/MacOS compatible versions,
I'll happily accept the pull request.

## Usage
Before attempting to run the script, make sure you have `manga_ocr`
running in the backround, monitoring the directory that you indicated
with the `save_path` variable in the `flameshot-ocr` script.

Run the script like this: `yomichan-search` from the terminal. Bind
this command to a keyboard shortcut for easy access. For example,
I have the script bound to `Alt + x`. So, when I am for example,
reading a manga and want to ocr and look up something, I
simply do the following:
1. Press `Alt + x`
2. Crop my region of choice
3. Done! Yomichan search will automatically pop up with the text
already searched.
