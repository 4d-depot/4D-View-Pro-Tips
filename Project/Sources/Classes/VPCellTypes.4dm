Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	This:C1470.activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
	
	// Create a button in the cell passed in parameter.
Function AddButton($cell : Object; $text : Text; $callBackMethod : Text)
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