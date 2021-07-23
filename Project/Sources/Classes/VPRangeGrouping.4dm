Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	This:C1470.activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
	
	// Groups the columns defined in the $columns range
Function groupColumn($columns : Object; $collapse : Boolean)
	var $js; $answer : Text
	
	$range:=cs:C1710.VPRangeReader.new($columns)
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.rowOutlines.group("+String:C10($range.row())+", "+String:C10($range.rowCount())+");"
	$js:=$js+"activeSheet.rowOutlines.setCollapsed("+String:C10($range.row())+","+Choose:C955(Bool:C1537($collapse); "true"; "false")+");"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Groups the rows defined in the $rows range
Function groupRow($rows : Object; $collapse : Boolean)
	var $js; $answer : Text
	
	$range:=cs:C1710.VPRangeReader.new($rows)
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.columnOutlines.group("+String:C10($range.column())+", "+String:C10($range.columnCount())+");"
	$js:=$js+"activeSheet.columnOutlines.setCollapsed("+String:C10($range.column())+","+Choose:C955(Bool:C1537($collapse); "true"; "false")+");"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Collapses or expands a column group
Function collapseColumns($startColumn : Integer; $collapse : Boolean)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.rowOutlines.setCollapsed("+String:C10($startColumn)+","+Choose:C955(Bool:C1537($collapse); "true"; "false")+");"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Collapses or expands a row group
Function collapseRows($startRow : Integer; $collapse : Boolean)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.columnOutlines.setCollapsed("+String:C10($startRow)+","+Choose:C955(Bool:C1537($collapse); "true"; "false")+");"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Ungroups all the group created
Function ungroupAll()
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.rowOutlines.ungroup();"
	$js:=$js+"activeSheet.columnOutlines.ungroup();"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)