#!/bin/bash

# -- Usage Instructions --							#
# This script should be run inside a detached screen session:			#
#     screen -dmS webdqm-plotmaker ./mylittlemaker.sh				#
# First make sure that there is not already one running - check the output of:	#
#     screen -list								#
# and if there is already a webdqm-plotmaker, you don't need to run this!	#

inotifywait -m -e close_write -r /home/daq/eudaq-shift/data_root |
    while read path action file; do
        if [[ "$file" =~ dqm_run[0-9]{4}.root ]]
        then
            runnumber="$(echo $file | sed 's/[^0-9]//g' | sed 's/^0*//')"
            /home/daq/web_dqm/scripts/end_of_run.sh $runnumber
        fi
    done
