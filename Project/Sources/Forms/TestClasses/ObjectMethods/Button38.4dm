var $rules : cs:C1710.VPRules

$range:=VP Cells("ViewProArea"; 1; 1; 20; 20)
VP SET BORDER($range; New object:C1471("color"; "black"; "style"; vk line style thick:K89:38); New object:C1471("outline"; True:C214))

$rules:=cs:C1710.VPRules.new("ViewProArea")

$rules.addRowStateRule($range; "hover"; "'rgb(205, 228, 153)'")

