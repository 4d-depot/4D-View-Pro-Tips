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
	
Function addDropDown($cell : Object; $command : Text; $dropDowns : Collection)
	// $command : "openCalculator" / "openDateTimePicker / "openMonthPicker" / "openTimePicker" / "openColorPicker" / "openList" / "openSlider" / "openWorkflowList" / "openMultiColumn" 
	// $dropDowns :  not always required. The type attribute must be an integer.  See https://developer.mescius.com/spreadjs/docs/features/cells/cell-dropdowns
	// .type attribute must be an integer :
	//    GC.Spread.Sheets.DropDownType.calculator: 6
	//    GC.Spread.Sheets.DropDownType.colorPicker: 0
	//    GC.Spread.Sheets.DropDownType.dateTimePicker: 1
	//    GC.Spread.Sheets.DropDownType.list: 4
	//    GC.Spread.Sheets.DropDownType.monthPicker: 3
	//    GC.Spread.Sheets.DropDownType.multiColumn: 8
	//    GC.Spread.Sheets.DropDownType.slider: 5
	//    GC.Spread.Sheets.DropDownType.timePicker: 2
	//    GC.Spread.Sheets.DropDownType.workflowList: 7
	var $js; $answer : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	// Set Dropdown
	$js:=This:C1470.activeSheet
	$js+="var cellStyle = new GC.Spread.Sheets.Style();"
	$js+="cellStyle.cellButtons = ["
	$js+="{"
	$js+="imageType: GC.Spread.Sheets.ButtonImageType.dropdown,"
	$js+="command: '"+$command+"',"
	$js+="useButtonStyle: true,"
	$js+="}"
	$js+="];"
	If (($dropDowns#Null:C1517) && ($dropDowns.first().type#Null:C1517))
		
		$js+="cellStyle.dropDowns = "+JSON Stringify:C1217($dropDowns)+";"
		
	End if 
	$js+="activeSheet.setStyle("+String:C10($range.row())+","+String:C10($range.column())+", cellStyle);"
	
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Creates a type from a given sheet and apply it on a givent range
Function applyTemplateToCells($numSheetTemplate : Integer; $renderRange : Object)
	var $js; $answer : Text
	
	// Type creation
	$js:="(function (){"
	$js+="var templateSheet=Utils.spread.sheets["+String:C10($numSheetTemplate)+"];"
	$js+="var rangeTemplateCelltype = new GC.Spread.Sheets.CellTypes.RangeTemplate(templateSheet);"
	
	var $range:=cs:C1710.VPRangeReader.new($renderRange)
	// Sets a cell with the type created above
	$js+="var renderSheet=Utils.spread.sheets["+String:C10($range.sheet())+"];"
	$js+="renderSheet.getRange("+String:C10($range.row())+","+String:C10($range.column())+","+String:C10($range.rowCount())+","+String:C10($range.columnCount())+").cellType(rangeTemplateCelltype);"
	$js+="})();"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	
	
	
	
	