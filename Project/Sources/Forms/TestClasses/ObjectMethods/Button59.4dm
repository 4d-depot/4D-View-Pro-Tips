$range:=VP Cells("ViewProArea"; 1; 1; 2; 3)

$header:=cs:C1710.VPHeader.new("ViewProArea")
$header.addRowHeaderSpan($range)


$header.setRowHeaderValue(VP Cells("ViewProArea"; 1; 1; 2; 3); "span 2")