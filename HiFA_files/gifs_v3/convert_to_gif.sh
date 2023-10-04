#!/bin/bash
#basename=$1
for name in ~/Desktop/tmp/videos/videos/*.mp4; do
	bn=$(basename $name)
	ffmpeg -i $name frame%04d.png
	gifski -o $bn.gif frame*.png
	find . -name "frame*.png" -delete
done



#ffmpeg -i ../$basename-mesh.mkv -filter_complex "[0:v]crop=1080:1080:420:0[cropped]" -map "[cropped]" frame%04d.png
#gifski -o $basename-mesh.gif frame*.png
#find . -name "frame*.png" -delete
