#
# CarlStaTrig's Parameter File
#
#  Basic Earthworm Setup
#
MyModuleId	MOD_CARLSTATRIG	# Module id for this instance of CarlStaTrig
				# 
Debug		0		# Write out debug messages? (0 = No,
				#   1 = Minimal, 3 = Chatterbox )
RingNameIn	WAVE_RING	# Name of ring from which trace data will be
				#   read - REQUIRED.
RingNameOut	PICK_RING	# Name of ring to which triggers will be
				#   written - REQUIRED.
HeartBeatInterval     10        # Heartbeat Interval (seconds).

#
# CarlTrig Specific Setup
#
StationFile	"memphis_trig.sta"	# Name of file containing station information -
				#   REQUIRED.
MaxGap		1.5		# Maximum gap between trace data points that
				#   can be interpolated (otherwise restart the
				#   station).
StartUp	        7		# Minimum seconds of trace data needed to
				#   before using LTAs

LTAtime         8               # Number of seconds for LTA average

#Ratio          2.3             # original UW param
#Quiet          4.0             # original UW param
Ratio           1.8
Quiet           2.0
Decimation      1               # Decimation factor used in averages
