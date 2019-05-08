# system related
export PATH="${PATH}:~/.local/bin"
export PATH="${PATH}:~/bin"

# others (additional PATHs should go before pwd)
export PATH="${PATH}:."

# make python use UTF-8 encoding for output to stdin, stdout, stderr
export PYTHONIOENCODING='UTF-8'

# colored GCC warnings and errors;
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Mongo
export MONGO_HOST='127.0.0.1'
export MONGO_PORT='27017'

# MySQL
export MYSQL_HOST='127.0.0.1'
export MYSQL_PORT='3306'
