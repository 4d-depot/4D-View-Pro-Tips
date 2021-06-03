
$cell:=VP Get active cell("ViewProArea")
$lastRow:=cs:C1710.VPCurrentSheet.new("ViewProArea").getLastNonEmptyRow()
$lastCol:=cs:C1710.VPCurrentSheet.new("ViewProArea").getLastNonEmptyCol()

VP SET ACTIVE CELL(VP Cell("ViewProArea"; $lastCol; $lastRow))
