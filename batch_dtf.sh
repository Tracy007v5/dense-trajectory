#!/usr/bin/env bash

VIDEODIR=/home/wcj/UCF-101/BalanceBeam
for f in `ls -S ${VIDEODIR}/*.avi | tac`
do
  EXT="${f##*.}"
  FILENOEXT="${f%.*}"
  FEATUREFILE=${FILENOEXT}.dtf.gz
  echo "Processing $f file..."
  ./release/DenseTrackStab $f | gzip > ${FEATUREFILE}
done
