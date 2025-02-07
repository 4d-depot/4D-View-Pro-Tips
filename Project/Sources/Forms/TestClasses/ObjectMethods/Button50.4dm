
$last:=cs:C1710.VPNavigation.new("ViewProArea").getLastColumnAndRowWithValue()

VP SET ACTIVE CELL(VP Cell("ViewProArea"; Num:C11($last.column); Num:C11($last.row)))
