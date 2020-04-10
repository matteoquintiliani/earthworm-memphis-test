# This is binder's parameter file!
#---------------------------------
 MyModuleId   MOD_BINDER_EW # module id for this instance of binder
 RingName     PICK_RING     # transport ring for I/O
# withers warning (20060517).  apparently if this param is configured then the
# ring needs to be defined in earthworm.d but can not be defined in
# startstop.d.
 BufferRing   BINDER_RING     # private ring for buffering incoming picks
                            #  (default=BINDER_RING)
 LogFile      1             # 0 = turn off logging
                            # 1 = log to disk and stderr/stdout 
                            # 2 = log to disk but not to stderr/stdout
 HeartbeatInt 30            # Seconds between heartbeats

# List the message logos to grab from transport ring
#              Installation       Module      # Message Type
#-------------------------------------------------------------
 GetPicksFrom  INST_WILDCARD    MOD_WILDCARD  # TYPE_PICK_SCNL

# Set level of output for writing log file
#-----------------------------------------
#log_stack            # comment out to turn of grid-stack logging
 hypcode    7         # Sets a value to specify how much information should be 
                      # included in binder's log file after each event 
                      # relocation. Possible values 0-7.
                        	
# Load station list
#------------------
 maxsite 2048
 site_file "memphis2.hinv"

# Load crustal model 
# Refer to file containing "lay" commands, or list them here
#-----------------------------------------------------------
#@ncal_model.d        # contents of ncal_model.d follow:
#lay   0.0     4.0
#lay   3.5     5.9
#lay   15.0    6.85
#lay   25.0    7.85
@embayment_model.d

# Set FIFO lengths
#-----------------
 pick_fifo_length  1000   # optional: default=1000
 quake_fifo_length  100   # optional: default=100

# Define association grid, set stacking parameters.
#--------------------------------------------------
 dspace     3.0
 grdlat    34.5    37.5
 grdlon  -91.25  -87.5
 grdz       0.0    30.0
 rstack   300.0
 tstack     0.65          # truncates to nearest 10th sec
 stack     300
 thresh    4
 focus     20
 grid_wt 0  4
 grid_wt 1  3
 grid_wt 2  2
 grid_wt 3  1

# Set parameters for associating picks with active hypocenters
#-------------------------------------------------------------
 rAvg_Factor 5.0
 taper   0.0     1.0
 taper   50.0    1.0
 taper   200.0   2.5
 taper   400.0   4.5
# bfh: 11/5/94: "variable taper" proportional to Origin Time Uncertainty:
# Set both to 0.0 to get Carl's original distance taper only.
 taper_OT 2.0    2.0
 t_dif   -1.0  120.

# Set parameters for locating events
#-----------------------------------
 wt 0 1.0
 wt 1 1.0
 wt 2 0.25
 wt 3 0.125
 ph P  1.0
 ph Pn 0.5
 ph Pg 0.5
 r_max  400.0
 zrange 1.0 40.0
 MaxStep 10.0  2.0
 MinXYZstep 0.1
 MaxIter 4
 MaxDeltaRms 1.0001
 locate_eq   5   2
 locate_eq  10   4
 locate_eq  50   8
 locate_eq 100  16

# Set parameters for assessing groups of picks
# with Bill Ellsworth's resampling technique:
#----------------------------------------------
 assess_pk  0  0
 maxtrial   500
 maxwt      3
 v_halfspace  5.0
 residual_cut  0.0  200.0
#log_accepted

# Load in the next valid quake sequence number
#---------------------------------------------
 EventIdFile quake_id.d

# THE END
