#!/bin/bash
. settings.sh

Rscript daily.r

egrep "$(date --iso-8601 -d "1 day ago")|Timestamp" $DATADIR/pingdata.csv > "$WEBDIR/archive/pingdata-$(date --iso-8601 -d "1 day ago")"
cp $DATADIR/pingdata.csv $DATADIR/temp.csv
egrep "$(date --iso-8601)|$(date --iso-8601 -d "1 day ago")|$(date --iso-8601 -d "2 days ago")|Timestamp" $DATADIR/temp.csv > $DATADIR/pingdata.csv
