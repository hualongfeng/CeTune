#!/bin/bash

DIR=/media/ceph/7
dirname=$(ls  ${DIR} -I "2019-*" -I "39-*" -I "81-*" -I "104-*" -I "167-*" -I "209-*" -I "251-*" -I "298-*" -I "323-*" -I "365-*" -I "400-*" -I "463-*" -I "512-*" -I "547-*" -I "588-*" -I "617-*" -I "666-*" -I "701-*" -I "764-*" -I "799-*" -I "848-*" -I "869-*" -I "911-*" -I "953-*" -I "995-*" -I "1051-*" -I "1100-*" -I "1120-*" -I "1176-*" -I "1206-*" -I "1255-*" -I "1290-*" -I "1353-*" -I "1388-*" -I "1423-*" -I "1464-*" -I "1506-*" -I "1549-*" -I "1584-*" -I "1647-*" -I "1689-*" -I "1792-*" -I "1772-*" -I "2503-*" -I "2419-*" -I "2251-*" -I "2335-* -I "2167-*" -I "2083-*" -I "2537-*" -I "2461-*" -I "2279-*" -I "2377-*" -I "2208-* -I "2006-*")

#dirname=$(ls -al /media/ceph/7 |awk '{if($5 == "53") {print $9}}')
#for dir in $dirname
#do
	#python ./analyzer.py --path /media/ceph/7/$dir/ process_data
#done

#dirname=$(ls /media/ceph/7|grep 2[0-9][0-9][0-9])
for dir in $dirname
do
	echo $DIR/$dir/raw
	rm -rf $DIR/$dir/raw
	
done
