# Create an Earthworm environment on Solaris!
# This file should be sourced by any shell wanting 
# to run or build EARTHWORM system.

# Set environment variables describing your Earthworm directory/version
setenv EW_HOME          /opt/earthworm/
setenv EW_VERSION       earthworm_7.9
setenv SYS_NAME         `hostname`

# Set environment variables used by earthworm modules at run-time
# Path names must end with the slash "/"
setenv EW_INSTALLATION  INST_MEMPHIS
setenv EW_PARAMS        ${EW_HOME}/memphis/params/
setenv EW_LOG           ${EW_HOME}/memphis/log/

# Also add Oracle paths to the current path.
set path=( ${EW_HOME}/${EW_VERSION}/bin /opt/oracle/bin /var/opt/oracle $path )
