#!/bin/bash
graphing(){
#Live Graphing
if (( speichervorhanden == 1 )); then
	echo $speicherleistung >> /var/www/html/openWB/ramdisk/speicher-live.graph
	echo $speichersoc >> /var/www/html/openWB/ramdisk/speichersoc-live.graph
fi
if [[ socmodul1 != "none" ]]; then
	echo $soc1 >> /var/www/html/openWB/ramdisk/soc1-live.graph
fi
echo $ladeleistunglp1 >> /var/www/html/openWB/ramdisk/ev1-live.graph
if (( lastmanagement == 1 )); then
	echo $ladeleistunglp2 >> /var/www/html/openWB/ramdisk/ev2-live.graph
fi
echo $((pvwatt * -1)) >> /var/www/html/openWB/ramdisk/pv-live.graph
echo $wattbezugint >> /var/www/html/openWB/ramdisk/evu-live.graph
echo $ladeleistung >> /var/www/html/openWB/ramdisk/ev-live.graph
echo $soc >> /var/www/html/openWB/ramdisk/soc-live.graph
date +%H:%M >> /var/www/html/openWB/ramdisk/time-live.graph
if [[ $livegraph =~ $re ]] ; then      
	livegraph=$((livegraph * 6 ))
	if ! [[ $livegraph =~ $re ]] ; then
		livegraph="30"
	fi
fi
echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/pv-live.graph)" > /var/www/html/openWB/ramdisk/pv-live.graph
echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/soc-live.graph)" > /var/www/html/openWB/ramdisk/soc-live.graph
echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/evu-live.graph)" > /var/www/html/openWB/ramdisk/evu-live.graph
echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/ev-live.graph)" > /var/www/html/openWB/ramdisk/ev-live.graph 
echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/ev1-live.graph)" > /var/www/html/openWB/ramdisk/ev1-live.graph 
if (( lastmanagement == 1 )); then
echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/ev2-live.graph)" > /var/www/html/openWB/ramdisk/ev2-live.graph 
fi
echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/time-live.graph)" > /var/www/html/openWB/ramdisk/time-live.graph
if ((speichervorhanden == 1 )); then
	echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/speicher-live.graph)" > /var/www/html/openWB/ramdisk/speicher-live.graph
	echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/speichersoc-live.graph)" > /var/www/html/openWB/ramdisk/speichersoc-live.graph
fi
if [[ socmodul1 != "none" ]]; then
	echo "$(tail -$livegraph /var/www/html/openWB/ramdisk/soc1-live.graph)" > /var/www/html/openWB/ramdisk/soc1-live.graph
fi
	

#Long Time Graphing
if (( graphtimer == 1 )) || (( graphtimer == 4 )); then
	echo $((pvwatt * -1)) >> /var/www/html/openWB/ramdisk/pv.graph
	echo $wattbezugint >> /var/www/html/openWB/ramdisk/evu.graph
	echo $soc >> /var/www/html/openWB/ramdisk/soc.graph
	echo $ladeleistung >> /var/www/html/openWB/ramdisk/ev.graph
	if (( speichervorhanden == 1 )); then
		echo $speicherleistung >> /var/www/html/openWB/ramdisk/speicher.graph
		echo $speichersoc >> /var/www/html/openWB/ramdisk/speichersoc.graph
	fi
	if [[ socmodul1 != "none" ]]; then
		echo $soc1 >> /var/www/html/openWB/ramdisk/soc1.graph
	fi
	echo $ladeleistunglp1 >> /var/www/html/openWB/ramdisk/ev1.graph
	if (( lastmanagement == 1 )); then
		echo $ladeleistunglp2 >> /var/www/html/openWB/ramdisk/ev2.graph
	fi
	if (( dpseed == "3" )); then
		livegraphtime="240"
	else
		livegraphtime="1440"
	fi
	date +%H:%M >> /var/www/html/openWB/ramdisk/time.graph
	echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/pv.graph)" > /var/www/html/openWB/ramdisk/pv.graph
	echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/evu.graph)" > /var/www/html/openWB/ramdisk/evu.graph
	echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/soc.graph)" > /var/www/html/openWB/ramdisk/soc.graph
	echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/ev.graph)" > /var/www/html/openWB/ramdisk/ev.graph 
	echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/ev1.graph)" > /var/www/html/openWB/ramdisk/ev1.graph
	if (( lastmanagement == 1 )); then	
		echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/ev2.graph)" > /var/www/html/openWB/ramdisk/ev2.graph 
	fi
	echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/time.graph)" > /var/www/html/openWB/ramdisk/time.graph
	if ((speichervorhanden == 1 )); then
		echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/speicher.graph)" > /var/www/html/openWB/ramdisk/speicher.graph
		echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/speichersoc.graph)" > /var/www/html/openWB/ramdisk/speichersoc.graph
	fi
	if [[ socmodul1 != "none" ]]; then
		echo "$(tail -$livegraphtime /var/www/html/openWB/ramdisk/soc1.graph)" > /var/www/html/openWB/ramdisk/soc1.graph
	fi
fi
}
