# System related
export PATH=$PATH:~/bin
export PATH=$PATH:.

# Make python use UTF-8 encoding for output to stdin, stdout, stderr
export PYTHONIOENCODING='UTF-8'

# colored GCC warnings and errors;
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# IDE
export PATH=~/pycharm/bin:$PATH
export PATH=~/eclipse/cpp-oxygen/eclipse:$PATH

# mujoco & rllab & cassierl
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mjpro150/bin
export workspacePath=~/dev
export PYTHONPATH=$workspacePath/rllab:$PYTHONPATH
export PATH=~/anaconda2/bin:$PATH
