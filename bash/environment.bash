# system related
export PATH=${PATH}:~/bin
export PATH=${PATH}:~/.local/bin
export PATH=${PATH}:.

# make python use UTF-8 encoding for output to stdin, stdout, stderr
export PYTHONIOENCODING='UTF-8'

# colored GCC warnings and errors;
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# mujoco & rllab & cassierl
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:~/.mujoco/mjpro150/bin
export workspacePath=~/dev
export PYTHONPATH=${workspacePath}/rllab:${PYTHONPATH}
# export PATH=~/anaconda2/bin:${PATH}

# mongoDB
export MONGO_HOST='127.0.0.1'
export MONGO_DB_NAME='gymrats'

# mysql for cs340
export MYSQL_HOST='classmysql.engr.oregonstate.edu'
export MYSQL_USER='cs340_luuph'
export MYSQL_DB_NAME='cs340_luuph'
