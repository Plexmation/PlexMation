#!/bin/bash

#sonarr_episodefile_sourcefolder="/torrent/finish/tv-sonarr/Penny.Dreadful.S01E01.720p.HDTV.x264-2HD"
#sonarr_episodefile_sourcepath="/torrent/finish/tv-sonarr/Penny.Dreadful.S01E01.720p.HDTV.x264-2HD/penny.dreadful.s01e01.720p.hdtv.x264-2hd.mkv"

sonarr_label="tv-sonarr"
base_dir=$(basename $sonarr_episodefile_sourcefolder)

if [ "${base_dir}" == "${sonarr_label}" ];then
  echo "Single file torrent"
  exit
fi

find $sonarr_episodefile_sourcefolder -name \*.r[0-9][0-9] | egrep '.*' &>/dev/null

case $? in
  0)
  echo "Rar files present, deleting video files"
  echo `rm -rv "${sonarr_episodefile_sourcepath}"`
  ;;
  *)
  echo "No rar files, nothing to clean"
  ;;
