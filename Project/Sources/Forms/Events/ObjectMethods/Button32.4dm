
$range:=VP Get selection("ViewProArea")

$column:=cs:C1710.VPRangeReader.new($range).column()

$find:=cs:C1710.VPRangeGrouping.new("ViewProArea").findByColumn($column).collapse
If ($find#Null:C1517)
	cs:C1710.VPRangeGrouping.new("ViewProArea").collapseColumns($column; Not:C34($find))
End if 
