Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	
	// Returns the number of the last non empty row
Function getLastNonEmptyRow()->$lastRow : Integer
	var $js; $answer : Text
	
	$js:="(function (){"
	$js:=$js+"    try{"
	$js:=$js+"    let sheet = Utils.currentSheet;"
	$js:=$js+"    let rows = Object.keys(sheet.toJSON().data.dataTable);"
	$js:=$js+"  return rows[rows.length - 1];"
	$js:=$js+"    }"
	$js:=$js+"    catch(error){"
	$js:=$js+"        return 0;"
	$js:=$js+"    }"
	$js:=$js+"})();"
	$lastRow:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is integer:K8:5)
	
	// Returns the number of the last non empty column
Function getLastNonEmptyCol()->$lastCol : Integer
	var $js; $answer : Text
	
	$js:="(function (){"
	$js:=$js+"    try{"
	$js:=$js+"    let sheet = Utils.currentSheet;"
	$js:=$js+"    let json = sheet.toJSON();"
	$js:=$js+"    let dataTable = Object.keys(json.data.dataTable);"
	$js:=$js+"    let nonEmptyColIndex = -1;"
	$js:=$js+"    dataTable.forEach((row) => {"
	$js:=$js+"      let rowArray = Object.keys(json.data.dataTable[row]);"
	$js:=$js+"      rowArray.forEach((col) => {"
	$js:=$js+"        nonEmptyColIndex = Math.max(nonEmptyColIndex, col);"
	$js:=$js+"      });"
	$js:=$js+"    });"
	$js:=$js+"    return nonEmptyColIndex;"
	$js:=$js+"}"
	$js:=$js+"catch(error){"
	$js:=$js+"    return 0;"
	$js:=$js+"}"
	$js:=$js+"})();"
	$lastCol:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is integer:K8:5)
	
	
	// Returns the last row with a value and the last column with a value.
	// Does not take into account the style
Function getLastColumnAndRowWithValue()->$lastCell : Object
	
	var $js; $answer : Text
	
	$js:="(function (){"
	$js:=$js+"    try{"
	$js:=$js+"    let sheet = Utils.currentSheet;"
	$js:=$js+"    let json = sheet.toJSON();"
	$js:=$js+"    let dataTable = Object.keys(json.data.dataTable);"
	$js:=$js+"    let nonEmptyColIndex = 0;"
	$js:=$js+"    let nonEmptyRowIndex = 0;"
	$js:=$js+"    dataTable.forEach((row) => {"
	$js:=$js+"      let rowArray = Object.keys(json.data.dataTable[row]);"
	$js:=$js+"      rowArray.forEach((col) => {"
	$js:=$js+"        if (json.data.dataTable[row][col].value!=undefined){"
	$js:=$js+"          nonEmptyColIndex = Math.max(nonEmptyColIndex, col);"
	$js:=$js+"          nonEmptyRowIndex = Number(row);"
	$js:=$js+"        }"
	$js:=$js+"      });"
	$js:=$js+"    });"
	$js:=$js+"    return {'column':nonEmptyColIndex,'row':nonEmptyRowIndex};"
	$js:=$js+"}"
	$js:=$js+"catch(error){"
	$js:=$js+"    return {'column':0,'row':0};;"
	$js:=$js+"}"
	$js:=$js+"})();"
	$lastCell:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is object:K8:27)
	
	
	// Returns the range of the next cell on the right
Function getRight($cell : Object)->$nextCell : Object
	var $range : cs:C1710.VPRangeReader
	var $nextCol : Integer
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	If (($range.column()+$range.columnCount())<(VP Get column count($range.areaName())))
		$nextCol:=$range.column()+1
	Else 
		$nextCol:=$range.column()
	End if 
	
	$nextCell:=VP Cells($range.areaName(); $nextCol; $range.row(); $range.columnCount(); $range.rowCount())
	
	// Returns the range of the next cell on the left
Function getLeft($cell : Object)->$nextCell : Object
	var $range : cs:C1710.VPRangeReader
	var $nextCol : Integer
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	$nextCol:=Choose:C955(($range.column()-1>0); $range.column()-1; 0)
	
	$nextCell:=VP Cells($range.areaName(); $nextCol; $range.row(); $range.columnCount(); $range.rowCount())
	
	// Returns the range of the next cell above
Function getAbove($cell : Object)->$nextCell : Object
	var $range : cs:C1710.VPRangeReader
	var $nextRow : Integer
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	$nextRow:=Choose:C955(($range.row()-1>0); $range.row()-1; 0)
	
	$nextCell:=VP Cells($range.areaName(); $range.column(); $nextRow; $range.columnCount(); $range.rowCount())
	
	// Returns the range of the next cell below
Function getBelow($cell : Object)->$nextCell : Object
	var $range : cs:C1710.VPRangeReader
	var $nextRow : Integer
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	If ($range.row()+$range.rowCount()<(VP Get row count($range.areaName())))
		$nextRow:=$range.row()+1
	Else 
		$nextRow:=$range.row()
		
		This:C1470.areaName:=$areaName
	End if 
	
	$nextCell:=VP Cells($range.areaName(); $range.column(); $nextRow; $range.columnCount(); $range.rowCount())
	
	// Returns the range of the next empty cell on the right
Function getNextRightEmptyCell($cell : Object)->$newCell : Object
	var $range : cs:C1710.VPRangeReader
	var $res : Collection
	var $startCol; $colCount; $offset : Integer
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	$startCol:=$range.column()+1
	$colCount:=VP Get column count($range.areaName())-$startCol
	If ($colCount>0)
		$res:=VP Get values(VP Cells($range.areaName(); $startCol; $range.row(); $colCount; 1))
		
		$offset:=0
		While (($res[0][$offset]#Null:C1517) & ($offset<($res[0].length-1)))
			$offset:=$offset+1
		End while 
		
		If (($res[0][$offset]=Null:C1517))
			$newCell:=VP Cell($range.areaName(); $startCol+$offset; $range.row())
		Else 
			$newCell:=$cell
		End if 
	Else 
		$newCell:=$cell
	End if 
	
	// Returns the range of the next empty cell on the left
Function getNextLeftEmptyCell($cell : Object)->$newCell : Object
	var $range : cs:C1710.VPRangeReader
	var $res : Collection
	var $startCol; $colCount; $col : Integer
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	$startCol:=0
	$colCount:=$range.column()
	If ($colCount>0)
		$res:=VP Get values(VP Cells($range.areaName(); $startCol; $range.row(); $colCount; 1))
		
		$col:=$colCount-1
		While (($res[0][$col]#Null:C1517) & ($col>0))
			$col:=$col-1
		End while 
		
		If (($res[0][$col]=Null:C1517))
			$newCell:=VP Cell($range.areaName(); $col; $range.row())
		Else 
			$newCell:=$cell
		End if 
	Else 
		$newCell:=$cell
	End if 
	
	// Returns the range of the next empty cell below
Function getNextEmptyCellBelow($cell : Object)->$newCell : Object
	var $range : cs:C1710.VPRangeReader
	var $res : Collection
	var $startRow; $rowCount; $offset : Integer
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	$startRow:=$range.row()+1
	$rowCount:=VP Get row count($range.areaName())-$startRow
	If ($rowCount>0)
		$res:=VP Get values(VP Cells($range.areaName(); $range.column(); $startRow; 1; $rowCount))
		
		$offset:=0
		While (($res[$offset][0]#Null:C1517) & ($offset<($res.length-1)))
			$offset:=$offset+1
		End while 
		
		If (($res[$offset][0]=Null:C1517))
			$newCell:=VP Cell($range.areaName(); $range.column(); $startRow+$offset)
		Else 
			$newCell:=$cell
		End if 
	Else 
		$newCell:=$cell
	End if 
	
	// Returns the range of the next empty cell above
Function getNextEmptyCellAbove($cell : Object)->$newCell : Object
	var $range : cs:C1710.VPRangeReader
	var $res : Collection
	var $startRow; $rowCount; $row : Integer
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	$startRow:=0
	$rowCount:=$range.row()
	If ($rowCount>0)
		$res:=VP Get values(VP Cells($range.areaName(); $range.column(); $startRow; 1; $rowCount))
		
		$row:=$rowCount-1
		While (($res[$row][0]#Null:C1517) & ($row>0))
			$row:=$row-1
		End while 
		
		If (($res[$row][0]=Null:C1517))
			$newCell:=VP Cell($range.areaName(); $range.column(); $row)
		Else 
			$newCell:=$cell
		End if 
	Else 
		$newCell:=$cell
	End if 
	
	
	
	