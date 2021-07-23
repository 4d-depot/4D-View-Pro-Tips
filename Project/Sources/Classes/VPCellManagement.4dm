Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	This:C1470.activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
	
	// Create a button in the cell passed in parameter.
Function addButton($cell : Object; $text : Text; $callBackMethod : Text)
	var $js; $answer : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	// button creation
	$js:=This:C1470.activeSheet
	$js:=$js+"var cellType = new GC.Spread.Sheets.CellTypes.Button();"
	$js:=$js+"cellType.text('"+String:C10($text)+"');"
	$js:=$js+"activeSheet.setCellType("+String:C10($range.row())+","+String:C10($range.column())+",cellType);"
	
	// binding an event to call the call back method passed in parameter
	$js:=$js+"Utils.spread.bind(GC.Spread.Sheets.Events.ButtonClicked, function (e, args) {"
	$js:=$js+"var row = args.row, col = args.col;"
	$js:=$js+"if (row=="+String:C10($range.row())+" && col=="+String:C10($range.column())+") {"
	$js:=$js+"$4d."+String:C10($callBackMethod)+"(args);"
	$js:=$js+"}"
	$js:=$js+"});"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Makes the current cell lose its focus and store the new value.
Function validateValue()
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"Utils.spread.commandManager().execute({cmd: 'commitArrayFormula', sheetName: activeSheet.name()})"
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Clears the fromcell value and enters edit mode.
Function clearAndEditing($fromRange : Object)
	var $from : cs:C1710.VPRangeReader
	var $fromjs; $js : Text
	
	$from:=cs:C1710.VPRangeReader.new($fromRange)
	
	$js:="var fromRange=[new GC.Spread.Sheets.Range("+String:C10($from.row())+","+String:C10($from.column())+","+String:C10($from.rowCount())+","+String:C10($from.columnCount())+")];"
	$js:=$js+This:C1470.activeSheet
	$js:=$js+"var sheetName=activeSheet.name();"
	$js:=$js+"spread.commandManager().execute({cmd: 'clearAndEditing', sheetName: sheetName, ranges:fromRange });"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Turns the active cell in edit mode and select the existing text if $selectAll is true
Function editActiveCell($selectAll : Boolean)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.startEdit("+Choose:C955(Bool:C1537($selectAll); "true"; "false")+");"
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Enables the user to see the formula in the cells.
Function showFormula($show : Boolean)
	var $answer : Text
	
	$answer:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; "Utils.spread.getActiveSheet().options.showFormulas = "+Choose:C955(Bool:C1537($show); "true"; "false")+";")
	
	// returns all the cells modified from the last dirty bit reset
Function modifiedCells($reset : Boolean)->$cells : Collection
	var $js; $answer : Text
	
	$js:="(function (){"
	$js:=$js+This:C1470.activeSheet
	$js:=$js+"return activeSheet.getDirtyCells();"
	$js:=$js+"})();"
	
	$cells:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is collection:K8:32)
	
	// reset dirty bit if asked
	If (Bool:C1537($reset))
		$js:="activeSheet.clearPendingChanges();"
		$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	End if 
	