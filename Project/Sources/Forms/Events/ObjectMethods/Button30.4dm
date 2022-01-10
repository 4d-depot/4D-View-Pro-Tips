
$range:=VP Get selection("ViewProArea")

$row:=cs:C1710.VPRangeReader.new($range).row()

$find:=cs:C1710.VPRangeGrouping.new("ViewProArea").findByRow($row).collapse
If ($find#Null:C1517)
	cs:C1710.VPRangeGrouping.new("ViewProArea").collapseRows($row; Not:C34($find))
End if 

