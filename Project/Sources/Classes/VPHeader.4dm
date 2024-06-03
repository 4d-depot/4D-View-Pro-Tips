Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	This:C1470.activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
	
	// Set the row count of column header to $count.
Function setColHeaderCount($count : Integer)
	var $js : Text
	
	$js:="(function (){"
	$js+=This:C1470.activeSheet
	$js+="activeSheet.setRowCount("+String:C10($count)+", GC.Spread.Sheets.SheetArea.colHeader);"
	$js+="})();"
	
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Set the row count of column header to $count.
Function setRowHeaderCount($count : Integer)
	var $js : Text
	
	$js:="(function (){"
	$js+=This:C1470.activeSheet
	$js+="activeSheet.setColumnCount("+String:C10($count)+", GC.Spread.Sheets.SheetArea.rowHeader);"
	$js+="})();"
	
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	
	// Merge cells in the column header
Function addColHeaderSpan($rangeSpan : Object)
	var $js : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($rangeSpan)
	
	$js:="(function (){"
	$js+=This:C1470.activeSheet
	$js+="activeSheet.addSpan("+String:C10($range.row())+","+String:C10($range.column())+","+String:C10($range.rowCount())+","+String:C10($range.columnCount())+", GC.Spread.Sheets.SheetArea.colHeader);"
	$js+="})();"
	
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Merge cells in the row header
Function addRowHeaderSpan($rangeSpan : Object)
	var $js : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($rangeSpan)
	
	$js:="(function (){"
	$js+=This:C1470.activeSheet
	$js+="activeSheet.addSpan("+String:C10($range.row())+","+String:C10($range.column())+","+String:C10($range.rowCount())+","+String:C10($range.columnCount())+", GC.Spread.Sheets.SheetArea.rowHeader);"
	$js+="})();"
	
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Set text in a column header cell
Function setColHeaderValue($rangeCell : Object; $value : Variant)
	var $js : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($rangeCell)
	
	$js:="(function (){"
	$js+=This:C1470.activeSheet
	$js+="activeSheet.setValue("+String:C10($range.row())+","+String:C10($range.column())+",'"+(String:C10($value))+"', GC.Spread.Sheets.SheetArea.colHeader);"
	$js+="})();"
	
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Set text in a row header cell
Function setRowHeaderValue($rangeCell : Object; $value : Variant)
	var $js : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($rangeCell)
	
	$js:="(function (){"
	$js+=This:C1470.activeSheet
	$js+="activeSheet.setValue("+String:C10($range.row())+","+String:C10($range.column())+",'"+(String:C10($value))+"', GC.Spread.Sheets.SheetArea.rowHeader);"
	$js+="})();"
	
	return WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	
	
	