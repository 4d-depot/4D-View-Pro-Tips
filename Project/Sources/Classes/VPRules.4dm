Class constructor($areaName : Text)
	// Need v19R5 (SpreadJS v15)
	This:C1470.areaName:=$areaName
	
	// Adds a row state rule to the rule collection.
	// $state: type of row and column state: hover/invalid/edit/active/selected/dirty/inserted
	// $color: backcolor of the row
Function addRowStateRule($range : Object; $state : Text; $color : Text)
	var $js; $answer : Text
	
	$js:=This:C1470._createStateRuleParameters($range; $state; $color)
	$js+="cfs.addRowStateRule(state, style, [rowRange]);"
	
	$answer:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; $js)
	
	// Adds a column state rule to the rule collection.
	// $state: type of row and column state: hover/invalid/edit/active/selected/dirty
	// $color: backcolor of the row
Function addColumnStateRule($range : Object; $state : Text; $color : Text)
	var $js; $answer : Text
	
	$js:=This:C1470._createStateRuleParameters($range; $state; $color)
	$js+="cfs.addColumnStateRule(state, style, [rowRange]);"
	
	$answer:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; $js)
	
	// Removes the rules from a specified range
Function removeRuleByRange($range : Object)
	var $js; $answer : Text
	
	$range:=cs:C1710.VPRangeReader.new($range)
	
	$js:="activeSheet=Utils.spread.getActiveSheet();"
	$js+="activeSheet.conditionalFormats.removeRuleByRange("+String:C10($range.row())+", "+String:C10($range.column())+", "+String:C10($range.rowCount())+", "+String:C10($range.columnCount())+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; $js)
	
Function _createStateRuleParameters($range : Object; $state : Text; $color : Text) : Text
	var $js : Text
	
	$range:=cs:C1710.VPRangeReader.new($range)
	
	$js:="activeSheet=Utils.spread.getActiveSheet();"
	$js+="let cfs = activeSheet.conditionalFormats;"
	
	Case of 
		: ($state="hover")  // When mouse hover on the row and the column , its state include "hover" state.
		: ($state="invalid")  // When the data-validation conditional evaluate fail, its row and column state include "invalid" state.
		: ($state="edit")  //When the cell is editing, the cell row and column state include "edit" state.
		: ($state="active")  //When the row or the column is focus, its state include "active" state.
		: ($state="selected")  //When the cell is in the selection range, the cell row and column state include "selected" state.
		: ($state="dirty")  //When cell value is changed, cell row and column state include "dirty" state.
		: ($state="inserted")  //When inserted a row, its state include "inserted" state. This state only support for row.
		Else 
			ALERT:C41("Parameter not supported: "+$state)
			return ""
	End case 
	$js+="let state=GC.Spread.Sheets.RowColumnStates."+$state+";"
	
	$js+="let style = new GC.Spread.Sheets.Style("+$color+");"
	$js+="let rowRange = new GC.Spread.Sheets.Range("+String:C10($range.row())+", "+String:C10($range.column())+", "+String:C10($range.rowCount())+", "+String:C10($range.columnCount())+"); "
	
	return $js