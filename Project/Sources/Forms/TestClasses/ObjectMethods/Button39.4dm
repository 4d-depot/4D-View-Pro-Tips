var $rules : cs:C1710.VPRules

$range:=VP Cells("ViewProArea"; 1; 1; 20; 20)

$rules:=cs:C1710.VPRules.new("ViewProArea")

$rules.removeRuleByRange($range)

