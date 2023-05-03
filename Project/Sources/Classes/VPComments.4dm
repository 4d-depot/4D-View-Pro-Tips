Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	This:C1470.activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
	
Function add($rangeTo : Object; $comment : Text)
	var $js; $answer : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($rangeTo)
	
	$js:=This:C1470.activeSheet
	$js+="activeSheet.comments.add("+String:C10($range.row())+","+String:C10($range.column())+",'"+String:C10($comment)+"');"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function get($rangeFrom : Object) : Object
	var $js : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($rangeFrom)
	
	$js:="(function (){"
	$js+=This:C1470.activeSheet
	$js+="return activeSheet.comments.get("+String:C10($range.row())+","+String:C10($range.column())+");"
	$js+="})();"
	
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is object:K8:27)
	
Function remove($rangeTo : Object)
	var $js; $answer : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($rangeTo)
	
	$js:=This:C1470.activeSheet
	$js+="activeSheet.comments.remove("+String:C10($range.row())+","+String:C10($range.column())+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)