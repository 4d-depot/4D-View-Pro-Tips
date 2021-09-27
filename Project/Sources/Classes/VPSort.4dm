Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	This:C1470.activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
	
	// $sortInfo structure see: www.grapecity.com/spreadjs/docs/v14/online/SpreadJS~GC.Spread.Sheets.Worksheet~sortRange.html?highlight=sortrange%2C
Function sortRange($rangeIn : Object; $byRows : Boolean; $sortInfo : Collection)
	var $range : cs:C1710.VPRangeReader
	var $js; $res : Text
	
	$range:=cs:C1710.VPRangeReader.new($rangeIn)
	
	$js:=This:C1470.activeSheet
	//  range of the block of cells to sort.
	$js:=$js+"activeSheet.sortRange("+String:C10($range.row())+", "+String:C10($range.column())+", "+String:C10($range.rowCount())+", "+String:C10($range.columnCount())+", "
	// Set to true to sort by rows, and false to sort by columns.
	$js:=$js+Choose:C955(Bool:C1537($byRows); "true, "; "false, ")
	// sort settings
	$js:=$js+JSON Stringify:C1217($sortInfo)+");"
	
	$res:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)