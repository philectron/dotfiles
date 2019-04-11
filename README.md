# dotfiles

## Notes

I recommend using this repository only as a template for your own dotfiles. My bash, vim, git, etc. settings here are _personal_ configurations and will certainly not fit everyone.

## Installation

    git clone https://github.com/philectron/dotfiles.git && cd dotfiles/ && ./install && git submodule update --init --recursive

Since Windows uses a different type of shortcut than UNIX, the linking commands in `install.conf.yaml` probably won't work. To fix this, in addition to the above command, double click on the batch file `install_windows.bat` to make Windows-style links to config (should be able to run it on Command Prompt as a standard user).
