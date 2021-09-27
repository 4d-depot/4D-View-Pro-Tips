var $r : cs:C1710.VPRangeReader
var $range : Object
var $sortInfo : Collection

$range:=VP Get selection("ViewProArea")

$r:=cs:C1710.VPRangeReader.new($range)

$sortInfo:=New collection:C1472
For ($i; $r.column(); $r.column()+$r.columnCount()-1)
	$sortInfo.push(New object:C1471("index"; $i; "ascending"; True:C214))
End for 

cs:C1710.VPSort.new("ViewProArea").sortRange($range; True:C214; $sortInfo)


