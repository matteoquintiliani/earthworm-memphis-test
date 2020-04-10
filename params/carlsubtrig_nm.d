#
# CarlSubTrig's Parameter File
#
# Carlsubtrig supports the ability to use late arriving station triggers in the
# subnet trigger logic. It maintains an internal clock which is set a fixed
# number of seconds (the latency period) behind wall-clock (real, system)
# time. This latency period allows for delayed delivery of station trigger
# messages. Carlsubtrig uses this internal clock to compare to station
# trigger times. Once the station trigger-on or -off time is later than the
# internal clock time, this trigger status change is noticed by carlsubtrig. In
# order for times to be compared between machines, all machines should
# be synchronized within a few seconds or better. Xntp (available with
# Solaris2.6 and also public domain) is a good choice for time
# synchronization.

# Because Carlsubtrig uses both system and data time to perform the
# subnet trigger logic, the system time must be set to UTC. If this is
# not done, no triggers will occur.
# Under NT, TZ must be set to GMT in ew_nt.cmd in order to run under
# GMT time.
#


#
#  Basic Earthworm Setup
#
MyModuleId	MOD_CARLSUBTRIGNM   # Module id for this instance of CarlSubTrig -
				#
Debug		0		# Write out debug messages? (0 = No,
				#   1 = Minimal, 3 = Chatterbox )
RingNameIn	PICK_RING	# Name of ring from which station triggers 
				#   will be read - REQUIRED.
RingNameOut	HYPO_RING	# Name of ring to which triggers will be
				#   written - REQUIRED.
HeartBeatInterval	15	# Heartbeat Interval (seconds).

#
# CarlSubTrig Specific Setup
#
StationFile	"memphis_trig.sta"	# Name of file containing station information -
				#   REQUIRED.
Latency		60		# Number of seconds that the Network clock
				#   is behind wall clock REQUIRED.
# withers increased these on 3/23/99 in an attempt to record more for events without
# messing up the triggering
NetTriggerDur   20		# Number of seconds for the base network
				#   trigger duration REQUIRED.
SubnetContrib  30               # Addition contribution to network trigger
				#   duration for each subnet that triggered
                                #   REQUIRED.
PreEventTime	15		# Number of seconds added to beginning of
				#   network trigger REQUIRED.
MaxDuration     500		# Maximum duration allowed for network trigger
DefStationDur   120		# Default number of seconds for station
				#   trigger duration if the trigger-off 
				#   message is not received. REQUIRED.
ListSubnets     2               # Flag to list untriggered stations
                                #   =0 or command not present: list all
                                #        triggered stations
                                #   =1 list all stations in triggered subnets
                                #   =2 list all stations in triggered subnets
                                #        plus any other triggered stations.
                                #   =3 list all stations in subnets that had
                                #        any stations triggered
AllSubnets       9              # If this many subnets trigger, put wildcard
                                #   SCN in event message
CompAsWild                      # Flag (no value) to list component names in
                                #   trigger messages as '*' (wildcard).
MaxTrigMsgLen   56700           # maximum length (bytes) of a triglist message;
                                #   up to MAX_BYTES_PER_EW (earthworm.h).

# Load the next valid trigger sequence number
@trig_id.d            # this name is hard-coded; do not change

# List the message logos to grab from transport ring
#              Installation       Module          Message Types (hard-wired)
GetEventsFrom  INST_WILDCARD    MOD_WILDCARD  # TYPE_CARLSTATRIG # REQUIRED.

# Non-seismic or other channels that should be included in all event messages
# List one SCN per line, as many as you need
#Channel  *.TIM.UW
#Channel  LON.LHZ.UW

# Subnet definitions for the CarlSubTrig Earthworm module
# Each Subnet must be on a single line
# Subnet  Minimum to      List of Station.Component.Network
# Number  Trigger         Codes (space delimited)
# ------- ---  -------------------------------------------
#
# memphis subnets
#
# withers increased nsta from 6 to 8 for subnet 0 and 1 on 5/18/04
Subnet 0   8   MLNT.EGZ.NM.-- TUMT.EGZ.NM.-- WADM.SCZ.NM.-- BRGM.SCZ.NM.-- CWPT.SCZ.NM.-- GLST.SCZ.NM.-- RELT.SCZ.NM.-- DLAR.SCZ.NM.-- LVAR.SCZ.NM.-- TWAR.SCZ.NM.-- QUAR.SCZ.NM.-- PWLA.EHZ.NM.-- EBZ.EHZ.NM.-- SFTN.EHZ.NM.-- MPH.BHZ.NM.-- GNAR.HHZ.NM.-- 
#
Subnet 1   8   CCMO.EHZ.NM.-- FVM.EHZ.NM.-- SLM.EHZ.NM.-- TYS.EHZ.NM.-- CCM.BHZ.NM.-- WCI.BHZ.NM.-- WVT.BHZ.NM.-- BLO.BHZ.NM.-- MPH.BHZ.NM.-- UTM.BHZ.NM.-- PLAL.BHZ.NM.-- FVM.BHZ.NM.-- UALR.BHZ.NM.-- WVT.BHZ.US.-- WCI.BHZ.US.-- OXF.BHZ.US.-- MIAR.BHZ.US.-- 
#
# mkta subnets
#
Subnet 2 5 JHAR.EHZ.NM.-- QUAR.EHZ.NM.-- CPAR.EHZ.NM.-- HCAR.EHZ.NM.-- LRAR.EHZ.NM.-- TWAR.EHZ.NM.-- NFAR.EHZ.NM.-- BLAR.EHZ.NM.--
#
Subnet 3 5 TMAR.EHZ.NM.-- MSAR.EHZ.NM.-- RVAR.EHZ.NM.-- LVAR.EHZ.NM.-- BOAR.EHZ.NM.-- HCAR.EHZ.NM.--
#
Subnet 4 6 LVAR.EHZ.NM.-- BOAR.EHZ.NM.-- HCAR.EHZ.NM.-- HTAR.EHZ.NM.-- LRAR.EHZ.NM.-- MSAR.EHZ.NM.-- RVAR.EHZ.NM.-- TYAR.EHZ.NM.-- CPAR.EHZ.NM.-- BLAR.EHZ.NM.-- NFAR.EHZ.NM.-- TWAR.EHZ.NM.-- MTAR.EHZ.NM.-- JHAR.EHZ.NM.-- QUAR.EHZ.NM.-- TMAR.EHZ.NM.-- GNAR.HHZ.NM.-- LPAR.HHZ.NM.-- HBAR.HHZ.NM.--
#
# lnxt subnets
#
Subnet 5 5 HAWT.EHZ.NM.-- MCAM.EHZ.NM.-- RDGT.EHZ.NM.-- LNXT.HHZ.NM.-- HALT.HHZ.NM.-- GLAT.HHZ.NM.-- PEBM.HHZ.NM.--
#
Subnet 6 5 WADM.EHZ.NM.-- STAM.EHZ.NM.-- MORT.EHZ.NM.-- LEPT.EHZ.NM.-- GRAT.EHZ.NM.-- RDGT.EHZ.NM.-- MCAM.EHZ.NM.-- HAWT.EHZ.NM.--
#
Subnet 7 5 LEPT.EHZ.NM.-- GRAT.EHZ.NM.-- RDGT.EHZ.NM.-- GLST.EHZ.NM.-- NBNT.EHZ.NM.-- MFRT.EHZ.NM.-- RELT.EHZ.NM.--
#
Subnet 8 5 NNAR.EHZ.NM.-- EDIT.EHZ.NM.-- LNXT.HHZ.NM.-- HALT.HHZ.NM.-- GLAT.HHZ.NM.-- PEBM.HHZ.NM.--
#
Subnet 9 5 NNAR.EHZ.NM.-- MCAM.EHZ.NM.-- CHNM.EHZ.NM.-- HAWT.EHZ.NM.-- BRGM.EHZ.NM.--
#
# nmad subnets
#
Subnet 10 6 GUAM.EHZ.NM.-- BROM.EHZ.NM.-- BRNM.EHZ.NM.-- BACM.EHZ.NM.-- BETM.EHZ.NM.-- MLDM.EHZ.NM.-- COKM.EHZ.NM.-- MATM.EHZ.NM.-- TOPM.EHZ.NM.-- KEWM.EHZ.NM.-- CATM.EHZ.NM.-- PENM.HHZ.NM.-- HICK.HHZ.NM.-- HENM.HHZ.NM.-- PARM.HHZ.NM.--
#
Subnet 11 5 DWDM.EHZ.NM.-- MATM.EHZ.NM.-- KEWM.EHZ.NM.-- CHRM.EHZ.NM.-- EPRM.EHZ.NM.-- SJBM.EHZ.NM.-- CATM.EHZ.NM.-- NMDM.EHZ.NM.-- WALK.EHZ.NM.--
#
#Subnet 12 5 CATM.EHZ.NM.-- SJBM.EHZ.NM.-- NMDM.EHZ.NM.-- MARM.EHZ.NM.-- PGVM.EHZ.NM.-- POBM.EHZ.NM.-- PPLM.EHZ.NM.-- TIPT.EHZ.NM.-- WALK.EHZ.NM.--
Subnet 12 5 CATM.EHZ.NM.-- SJBM.EHZ.NM.-- NMDM.EHZ.NM.-- MARM.EHZ.NM.-- PGVM.EHZ.NM.-- POBM.EHZ.NM.-- PPLM.EHZ.NM.-- WALK.EHZ.NM.--
#
#Subnet 13 5 POBM.EHZ.NM.-- PPLM.EHZ.NM.-- TIPT.EHZ.NM.-- WYBT.EHZ.NM.-- FLPT.EHZ.NM.-- HOPT.EHZ.NM.--
Subnet 13 5 POBM.EHZ.NM.-- PPLM.EHZ.NM.-- WYBT.EHZ.NM.-- FLPT.EHZ.NM.-- HOPT.EHZ.NM.--
#

