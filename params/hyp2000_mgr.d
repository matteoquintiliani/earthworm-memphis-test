#
#               hypo_mgr's Configuration File
#
MyModuleId MOD_GEQPROC   # module id to label outgoing messages with.
                        # Note: hypo_mgr is part of a mega-module which is
                        # ultimately started by the program eqproc.  All
                        # child processes of this mega-module need to use the
                        # same module id (thus use eqproc's module id).
RingName   HYPO_RING    # The transport ring to write output to,
LogFile    2            # 0=no log; 1=errors; 2=errors & hypocenters
SourceCode W            # character to label summary cards with to 
                        # identify them as coming from Earthworm
