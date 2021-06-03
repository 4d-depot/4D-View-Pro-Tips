Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	This:C1470.activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
	
Function outlineColumn($column : Integer; $count : Integer; $copllapse : Boolean)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.rowOutlines.group("+String:C10($column)+", "+String:C10($count)+");"
	$js:=$js+"activeSheet.rowOutlines.setCollapsed("+String:C10($column)+","+Choose:C955(Bool:C1537($copllapse); "true"; "false")+");"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function outlineRow($row : Integer; $count : Integer; $copllapse : Boolean)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.columnOutlines.group("+String:C10($row)+", "+String:C10($count)+");"
	$js:=$js+"activeSheet.columnOutlines.setCollapsed("+String:C10($row)+","+Choose:C955(Bool:C1537($copllapse); "true"; "false")+");"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function collapseColumns($startColumn : Integer; $copllapse : Boolean)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.rowOutlines.setCollapsed("+String:C10($startColumn)+","+Choose:C955(Bool:C1537($copllapse); "true"; "false")+");"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function collapseRows($startRow : Integer; $copllapse : Boolean)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.columnOutlines.setCollapsed("+String:C10($startRow)+","+Choose:C955(Bool:C1537($copllapse); "true"; "false")+");"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function ungroupAll()
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.suspendPaint();"
	$js:=$js+"activeSheet.rowOutlines.ungroup();"
	$js:=$js+"activeSheet.columnOutlines.ungroup();"
	$js:=$js+"activeSheet.resumePaint();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)