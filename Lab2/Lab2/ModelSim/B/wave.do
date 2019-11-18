view wave 
wave clipboard store
wave create -driver freeze -pattern repeater -initialvalue 0 -period 500ps -sequence { 0 1  } -repeat forever -starttime 0ps -endtime 4000ps sim:/top/A 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 1000ps -sequence { 0 1  } -repeat forever -starttime 0ps -endtime 4000ps sim:/top/B 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 2000ps -sequence { 0 1  } -repeat forever -starttime 0ps -endtime 4000ps sim:/top/C 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 2000ps -sequence { 0 1  } -repeat forever -starttime 0ps -endtime 4000ps sim:/top/A 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 1000ps -sequence { 0 1  } -repeat forever -starttime 0ps -endtime 4000ps sim:/top/B 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 500ps -sequence { 0 1  } -repeat forever -starttime 0ps -endtime 4000ps sim:/top/C 
WaveCollapseAll -1
wave clipboard restore
