export WEBDIR=/code/PingGraph/test.web/
export PINGHOST=8.8.8.8
export DATADIR=/code/PingGraph/test.data/

if [ ! -d "$DATADIR" ]; then
  mkdir "$DATADIR"
fi

if [ ! -d "$WEBDIR" ]; then
  mkdir "$WEBDIR"
fi

if [ ! -d "${WEBDIR}archive" ]; then
  mkdir "${WEBDIR}archive"
fi

if [  ! -f ${DATADIR}pingdata.csv ]; then
  echo "Timestamp,sent,received,lost" > ${DATADIR}pingdata.csv
fi