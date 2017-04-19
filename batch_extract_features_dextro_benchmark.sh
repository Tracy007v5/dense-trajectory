#!/usr/bin/env bash

VIDEODIR=/home/wcj/UCF-101/ApplyEyeMakeup
for f in `ls -S ${VIDEODIR}/v_ApplyEyeMakeup_g01_c01.avi | tac`
do
  EXT="${f##*.}"
  FILENOEXT="${f%.*}"
  FEATUREFILE=${FILENOEXT}.features.gz
  echo "Processing $f file..."
  ./release/DenseTrackStab $f | gzip > ${FEATUREFILE}
done
