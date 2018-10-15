#!/bin/sh

source /afs/cern.ch/sw/lcg/external/gcc/4.9/x86_64-slc6-gcc49-opt/setup.sh
source /afs/cern.ch/sw/lcg/app/releases/ROOT/6.06.08/x86_64-slc6-gcc49-opt/root/bin/thisroot.sh


RUN=$(printf %04d $(( 10#$1 )))


echo "Will ran scripts for RUN: ${RUN}"


echo "Let's make the plots of Online Monitor"
echo ".... this may take some time ..."
reMade=0
reMadeRuns="0001 0002"

for r in $reMadeRuns 
do
    if [ "${RUN}" == "${r}" ]; then
        echo "This run is in the list of runs for which the histograms were remade:" ${RUN}
        reMade=1
    fi
done

if [ "${reMade}" == "1" ]; then
    #echo "remade"
    /home/daq/web_dqm/scripts/plot.py -f /home/daq/eudaq-shift/data_root/remade/dqm_run00${RUN}.root -o /home/daq/web_dqm/RUN_${RUN}_OnlineMon/
else
    #echo "else"
    /home/daq/web_dqm/scripts/plot.py -f /home/daq/eudaq-shift/data_root/dqm_run${RUN}.root -o /home/daq/web_dqm/RUN_${RUN}_OnlineMon/

fi
    
sleep 2

echo "All Done."
echo "Enjoy at http://svhgcal01.cern.ch/"
