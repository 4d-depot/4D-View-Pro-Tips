$count:=3

$header:=cs:C1710.VPHeader.new("ViewProArea")
$header.setRowHeaderCount($count)

$header.setRowHeaderValue(VP Cell("ViewProArea"; 0; 0); "header 0")
$header.setRowHeaderValue(VP Cell("ViewProArea"; 1; 0); "header 1")
$header.setRowHeaderValue(VP Cell("ViewProArea"; 2; 0); "header 2")
