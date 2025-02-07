var $header:=cs:C1710.VPHeader

$count:=4

$header:=cs:C1710.VPHeader.new("ViewProArea")
$header.setColHeaderCount($count)

$header.setColHeaderValue(VP Cell("ViewProArea"; 0; 0); "header 0")
$header.setColHeaderValue(VP Cell("ViewProArea"; 0; 1); "header 1")
$header.setColHeaderValue(VP Cell("ViewProArea"; 0; 2); "header 2")
$header.setColHeaderValue(VP Cell("ViewProArea"; 0; 3); "header 3")