var $range:=cs:C1710.VPRange.new("ViewProArea")

TRACE:C157

var $contains:=$range.contains(VP Cells("ViewProArea"; 0; 0; 1; 1); VP Cells("ViewProArea"; 0; 0; 1; 1))

var $contains2:=$range.contains(VP Cells("ViewProArea"; 1; 1; 0; 0); VP Cells("ViewProArea"; 0; 0; 10; 10))

var $contains3:=$range.contains(VP Cells("ViewProArea"; 0; 0; 1; 1); VP Cells("ViewProArea"; 0; 0; 1; 1))

var $contains4:=$range.contains(VP Cells("ViewProArea"; 0; 0; 1; 1); VP Cells("ViewProArea"; 10; 10; 1; 1))


var $intersect:=$range.intersect(VP Cells("ViewProArea"; 0; 0; 1; 1); VP Cells("ViewProArea"; 0; 0; 1; 1))

var $intersect2:=$range.intersect(VP Cells("ViewProArea"; 1; 1; 0; 0); VP Cells("ViewProArea"; 0; 0; 10; 10))

var $intersect3:=$range.intersect(VP Cells("ViewProArea"; 0; 0; 1; 1); VP Cells("ViewProArea"; 0; 0; 1; 1))

var $intersect4:=$range.intersect(VP Cells("ViewProArea"; 0; 0; 1; 1); VP Cells("ViewProArea"; 10; 10; 1; 1))