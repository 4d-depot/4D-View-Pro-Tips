If (FORM Event:C1606.code=On Selection Change:K2:29)
	var $range:=cs:C1710.VPRange.new("ViewProArea")
	
	// if user click in the quarterTable
	If ((FORM Event:C1606.newSelections.ranges[0].row#Null:C1517) && ($range.contains(VP Get table range("ViewProArea"; "QuarterTable"); FORM Event:C1606.newSelections)))
		
		// Gets the selected row number
		$selectedRow:=FORM Event:C1606.newSelections.ranges[0].row-1
		var $context:=VP Get data context("ViewProArea")
		// Copies the selected row in the currentRow collection
		// The currentRow collection is bind to the SelectedQuarterTableRow table so it is automatically updated
		// Like the graph refers to the SelectedQuarterTableRow, it is automatically updated too
		$context.currentRow:=[$context.graph[$selectedRow]]
		
		// refresh datacontext
		VP SET DATA CONTEXT("ViewProArea"; $context)
		
	End if 
End if 