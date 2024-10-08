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
Function copyPast($fromRange : Object; $toRange : Object; $isCutting : Boolean)
	
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
	$js:=$js+"var activeSheet=Utils.spread.getSheet("+String:C10($from.sheet())+");"
	$js:=$js+"var toSheetName=Utils.spread.getSheet("+String:C10($to.sheet())+").name();"
	$js:=$js+"Utils.spread.commandManager().execute({cmd: 'clipboardPaste', sheetName:toSheetName, fromSheet: activeSheet, fromRanges: fromRange, pastedRanges: toRange, isCutting: "+$isCuttingjs+", clipboardText: '', pasteOption: GC.Spread.Sheets.ClipboardPasteOption"+"s.all});"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Returns the range corresponding to the letters of the cells passed in parameter
Function cellLetterToRange($cellLetter : Text) : Object
	var $js : Text
	var $ranges : Collection
	var $range : Object
	
	$js:="(function (){"
	$js:=$js+"let ranges=GC.Spread.Sheets.CalcEngine.formulaToRanges(Utils.currentSheet,'"+$cellLetter+"');"
	$js:=$js+"ranges[0].sheetIndex=Utils.spread.getSheetIndex(ranges[0].sheetName);"
	$js:=$js+"return ranges;"
	$js:=$js+"})();"
	$ranges:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is collection:K8:32)
	$sheetIndex:=$ranges[0].sheetIndex
	$range:=$ranges[0].ranges[0]
	Case of 
		: (($range.colCount=-1) && ($range.rowCount=-1))
			return VP All(This:C1470.areaName; $sheetIndex)
		: ($range.col=-1)  // Entrée avec une plage de rows sans colonnes.
			return VP Row(This:C1470.areaName; $range.row; $range.rowCount; $sheetIndex)
		: ($range.row=-1)  // Entrée avec une plage de colonnes sans rows.
			return VP Column(This:C1470.areaName; $range.col; $range.colCount; $sheetIndex)
		Else 
			return VP Cells(This:C1470.areaName; $range.col; $range.row; $range.colCount; $range.rowCount; $sheetIndex)
	End case 
	