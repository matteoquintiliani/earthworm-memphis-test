@ echo off

@rem Set environment variables used by earthworm modules at run-time
@rem ---------------------------------------------------------------
set EW_INSTALLATION=INST_MEMPHIS
set EW_HOME=c:\earthworm
set EW_VERSION=earthworm_7.9
set EW_PARAMS=%EW_HOME%\memphis\params
set EW_LOG=%EW_HOME%\memphis\log\
set EW_DATA_DIR=%EW_HOME%\memphis\data\

set SYS_NAME=%COMPUTERNAME%

@rem --------------------------
set TZ=GMT
@rem Set the path
@rem ------------------------------------------------------
set Path=%Path%;c:\Program Files\keditw;c:\local\bin;%EW_HOME%\%EW_VERSION%\bin;e:orant\bin
