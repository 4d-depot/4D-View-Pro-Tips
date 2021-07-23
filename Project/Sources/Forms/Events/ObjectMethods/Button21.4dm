
$range:=VP Get selection("ViewProArea")

cs:C1710.VPRangeGrouping.new("ViewProArea").groupRow($range; False:C215)

cs:C1710.VPRangeGrouping.new("ViewProArea").groupColumn($range; False:C215)
