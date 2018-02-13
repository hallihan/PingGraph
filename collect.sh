#!/bin/bash
. settings.sh

result=(`ping -w 120 -c 120 $PINGHOST | grep "packet loss"| cut -d, -f1,2,3| cut -d\  -f 1,4,6`)
echo `date --iso-8601=m`,${result[0]},${result[1]},${result[2]} >> ${DATADIR}pingdata.csv
./formatter.sh > ${WEBDIR}index.html
Rscript graph.r