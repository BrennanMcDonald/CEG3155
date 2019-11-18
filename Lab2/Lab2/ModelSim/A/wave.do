view wave 
wave clipboard store
wave create -driver freeze -pattern repeater -initialvalue 1 -period 2000ps -sequence { 1 0  } -repeat 1 -starttime 0ps -endtime 4000ps sim:/halfadder/A 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 1000ps -sequence { 0 1  } -repeat 2 -starttime 0ps -endtime 4000ps sim:/halfadder/B 
wave modify -driver freeze -pattern repeater -initialvalue 0 -period 2000ps -sequence { 0 1  } -repeat 1 -starttime 0ps -endtime 4000ps Edit:/halfadder/A 
WaveCollapseAll -1
wave clipboard restore
