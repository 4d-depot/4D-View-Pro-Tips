// Analyses the information includes in a range or combined range
Class constructor($range : Object)
	
	If ($range=Null:C1517)
		This:C1470.range:=New object:C1471  // Original range
	Else 
		This:C1470.range:=$range  // Original range
	End if 
	
	// Number of the 'current' range 
	This:C1470._rangeNumber:=0
	
Function areaName()->$name : Text
	$name:=This:C1470.range.area
	
	// Set or get the current range number
Function rangeNumber($number : Integer)->$rangeNumber : Integer
	If (Count parameters:C259>0)
		If ($number<This:C1470.length())
			This:C1470._rangeNumber:=$number
		End if 
	End if 
	$rangeNumber:=This:C1470._rangeNumber
	
	
	// Returns the number of ranges present in the original range
Function length()->$length : Integer
	$length:=This:C1470.range.ranges.length
	
	// Verify if the original range contains at least one range
Function isEmpty()->$isEmpty : Boolean
	$isEmpty:=(This:C1470.length()=0)
	
	// Returns the row number of the current range
Function row()->$row : Integer
	If (This:C1470.isEmpty())
		$row:=0
	Else 
		If (This:C1470.range.ranges[This:C1470._rangeNumber].row#Null:C1517)
			$row:=Num:C11(This:C1470.range.ranges[This:C1470._rangeNumber].row)
		Else 
			$row:=0
		End if 
	End if 
	
	// Returns the row count of the current range
Function rowCount()->$rowc : Integer
	If (This:C1470.isEmpty())
		$rowc:=1
	Else 
		If (This:C1470.range.ranges[This:C1470._rangeNumber].rowCount#Null:C1517)
			$rowc:=Num:C11(This:C1470.range.ranges[This:C1470._rangeNumber].rowCount)
		Else 
			If (This:C1470.range.ranges[This:C1470._rangeNumber].row#Null:C1517)
				$rowc:=1
			Else 
				$rowc:=-1
			End if 
		End if 
	End if 
	
	// Returns the column number of the current range
Function column()->$column : Integer
	If (This:C1470.isEmpty())
		$column:=0
	Else 
		If (This:C1470.range.ranges[This:C1470._rangeNumber].column#Null:C1517)
			$column:=Num:C11(This:C1470.range.ranges[This:C1470._rangeNumber].column)
		Else 
			$column:=0
		End if 
	End if 
	
	// Returns the column count of the current range
Function columnCount()->$columnc : Integer
	If (This:C1470.isEmpty())
		$columnc:=1
	Else 
		If (This:C1470.range.ranges[This:C1470._rangeNumber].columnCount#Null:C1517)
			$columnc:=Num:C11(This:C1470.range.ranges[This:C1470._rangeNumber].columnCount)
		Else 
			If (This:C1470.range.ranges[This:C1470._rangeNumber].column#Null:C1517)
				$columnc:=1
			Else 
				$columnc:=-1
			End if 
		End if 
	End if 
	
	// Returns the sheet number of the current range
Function sheet()->$sheet : Integer
	var $js : Text
	If (This:C1470.isEmpty())
		$js:="(function (){"
		$js:=$js+"return Utils.spread.getActiveSheetIndex();"
		$js:=$js+"})();"
		$sheet:=WA Evaluate JavaScript:C1029(*; This:C1470.range.area; $js; Is integer:K8:5)
	Else 
		If (This:C1470.range.ranges[This:C1470._rangeNumber].sheet=Null:C1517)
			$js:="(function (){"
			$js:=$js+"return Utils.spread.getActiveSheetIndex();"
			$js:=$js+"})();"
			$sheet:=WA Evaluate JavaScript:C1029(*; This:C1470.range.area; $js; Is integer:K8:5)
		Else 
			$sheet:=Num:C11(This:C1470.range.ranges[This:C1470._rangeNumber].sheet)
		End if 
	End if 
	
	// Returns the first range
Function firstRange()->$range : Object
	If (This:C1470.length()>1)
		$range:=This:C1470._splitRange(0)
	Else 
		$range:=This:C1470.range
	End if 
	
	// Returns the last range
Function lastRange()->$range : Object
	If (This:C1470.length()>1)
		$range:=This:C1470._splitRange(This:C1470.length()-1)
	Else 
		$range:=This:C1470.range
	End if 
	
Function nextRange()->$range : Object
	This:C1470._rangeNumber:=This:C1470._rangeNumber+1
	If (This:C1470._rangeNumber<This:C1470.length())
		$range:=This:C1470._splitRange(This:C1470._rangeNumber)
	Else 
		$range:=Null:C1517
	End if 
	
	// Returns the current range
Function currentRange()->$range : Object
	If (This:C1470.length()>1)
		$range:=This:C1470._splitRange(This:C1470._rangeNumber)
	Else 
		$range:=This:C1470.range
	End if 
	
	// Exports a range according the position of a specific range in the original one
Function _splitRange($pos : Integer)->$newRange : Object
	$newRange:=New object:C1471("area"; This:C1470.range.area; "ranges"; New collection:C1472())
	$newRange.ranges.push(This:C1470.range.ranges[$pos])
	
	// Convert the range in letter as "$A$1:$C$10"
Function toLetter()->$formula : Text
	var $js : Text
	
	$js:="(function (){"
	$js:=$js+"var range=[new GC.Spread.Sheets.CellRange("+String:C10(This:C1470.sheet())+","+String:C10(This:C1470.row())+","+String:C10(This:C1470.column())+","+String:C10(This:C1470.rowCount())+","+String:C10(This:C1470.columnCount())+")];"
	$js:=$js+"return GC.Spread.Sheets.CalcEngine.rangesToFormula(range);"
	$js:=$js+"})();"
	$formula:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName(); $js; Is text:K8:3)
	