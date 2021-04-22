Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	
	// Modify the unit of selection 
	// 0: standard mode. Selects the clicked cell
	// 1: Selects the entire column of the clicked cell 
	// 2: Selects the entire row of the clicked cell 
Function selectionUnit($unit : Integer)
	var $arg : Text
	var $answer : Text
	
	Case of 
		: ($unit=0)
			$arg:="GC.Spread.Sheets.SelectionUnit.cell"
		: ($unit=1)
			$arg:="GC.Spread.Sheets.SelectionUnit.row"
		: ($unit=2)
			$arg:="GC.Spread.Sheets.SelectionUnit.column"
		Else 
			$arg:="GC.Spread.Sheets.SelectionUnit.cell"
	End case 
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; "Utils.currentSheet.selectionUnit("+$arg+");")
	
	
	// copy/cut the fromrange and past it in the torange
Function CopyPast($fromRange : Object; $toRange : Object; $isCutting : Boolean)
	
	var $from : cs:C1710.VPRangeReader
	var $to : cs:C1710.VPRangeReader
	var $fromjs; $tojs; $answer : Text
	var $isCuttingjs : Text
	
	$from:=cs:C1710.VPRangeReader.new($fromRange)
	$to:=cs:C1710.VPRangeReader.new($toRange)
	
	$fromjs:="var fromRange=[new GC.Spread.Sheets.Range("+String:C10($from.row())+","+String:C10($from.column())+","+String:C10($from.rowCount())+","+String:C10($from.columnCount())+")];"
	
	$tojs:="var toRange=[new GC.Spread.Sheets.Range("+String:C10($to.row())+","+String:C10($to.column())+","+String:C10($from.rowCount())+","+String:C10($from.columnCount())+")];"
	
	If (Bool:C1537($isCutting))
		$isCuttingjs:="true"
	Else 
		$isCuttingjs:="false"
	End if 
	
	$js:=$fromjs
	$js:=$js+$tojs
	$js:=$js+"var activeSheet=Utils.spread.getActiveSheet();"
	$js:=$js+"var sheetName=activeSheet.name();"
	$js:=$js+"spread.commandManager().execute({cmd: 'clipboardPaste', sheetName:sheetName, fromSheet: activeSheet, fromRanges: fromRange, pastedRanges: toRange, isCutting: "+$isCuttingjs+", clipboardText: '', pasteOption: GC.Spread.Sheets.ClipboardPasteOption"+"s.all});"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	
	// Makes the cell lose its focus and store the new value.
Function validateCellValue()
	var $js; $answer : Text
	
	$js:="Utils.spread.commandManager().execute({cmd: 'commitArrayFormula', sheetName: Utils.spread.getActiveSheet().name()})"
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Clears the fromcell value and enters edit mode.
Function clearAndEditing($fromRange : Object)
	var $from : cs:C1710.VPRangeReader
	var $fromjs; $js : Text
	
	$from:=cs:C1710.VPRangeReader.new($fromRange)
	
	$js:="var fromRange=[new GC.Spread.Sheets.Range("+String:C10($from.row())+","+String:C10($from.column())+","+String:C10($from.rowCount())+","+String:C10($from.columnCount())+")];"
	$js:=$js+"var activeSheet=Utils.spread.getActiveSheet();"
	$js:=$js+"var sheetName=activeSheet.name();"
	$js:=$js+"spread.commandManager().execute({cmd: 'clearAndEditing', sheetName: sheetName, ranges:fromRange });"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function EditActiveCell($selectAll : Boolean)
	var $js; $answer : Text
	
	$js:="Utils.spread.getActiveSheet().startEdit("+Choose:C955(Bool:C1537($selectAll); "true"; "false")+");"
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Enables the user to see the formula in a cell.
Function showFormula($show : Boolean)
	var $answer : Text
	
	$answer:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; "Utils.spread.getActiveSheet().options.showFormulas = "+Choose:C955(Bool:C1537($show); "true"; "false")+";")
	
	// returns all the cells modified from the last dirty bit reset
Function modifiedCells($reset : Boolean)->$cells : Collection
	var $js; $answer : Text
	
	$js:="(function (){"
	$js:=$js+"return Utils.spread.getActiveSheet().getDirtyCells();"
	$js:=$js+"})();"
	
	$cells:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is collection:K8:32)
	
	// reset dirty bit if asked
	If (Bool:C1537($reset))
		$js:="Utils.spread.getActiveSheet().clearPendingChanges();"
		$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	End if 
	
	