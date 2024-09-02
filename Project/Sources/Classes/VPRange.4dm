Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	
	// Gets whether the first range contains the second one.
Function contains($firstRange : Object; $secondRange : Object) : Boolean
	
	var $js:="(function (){"
	
	$first:=cs:C1710.VPRangeReader.new($firstRange)
	$js+="var Range=new GC.Spread.Sheets.Range("+String:C10($first.row())+","+String:C10($first.column())+","+String:C10($first.rowCount())+","+String:C10($first.columnCount())+");"
	
	$second:=cs:C1710.VPRangeReader.new($secondRange)
	$js+="return Range.contains("+String:C10($second.row())+","+String:C10($second.column())+","+String:C10($second.rowCount())+","+String:C10($second.columnCount())+");"
	
	$js+="})();"
	
	// return true if the first range contains the second one.
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is boolean:K8:9)
	
	// Gets whether the first range and the second one intersect.
Function intersect($firstRange : Object; $secondRange : Object) : Boolean
	
	var $js:="(function (){"
	
	$first:=cs:C1710.VPRangeReader.new($firstRange)
	$js+="var Range=new GC.Spread.Sheets.Range("+String:C10($first.row())+","+String:C10($first.column())+","+String:C10($first.rowCount())+","+String:C10($first.columnCount())+");"
	
	$second:=cs:C1710.VPRangeReader.new($secondRange)
	$js+="return Range.intersect("+String:C10($second.row())+","+String:C10($second.column())+","+String:C10($second.rowCount())+","+String:C10($second.columnCount())+");"
	
	$js+="})();"
	
	// return true if first range and the second one intersect. 
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is boolean:K8:9)
	