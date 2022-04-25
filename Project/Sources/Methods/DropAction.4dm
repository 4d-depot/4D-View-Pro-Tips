//%attributes = {}
#DECLARE($target : Object)

var $cell : Object

$targetedCell:=VP Cell("ViewProArea"; $target.col; $target.row)

VP SET VALUE($targetedCell; New object:C1471("value"; Form:C1466.dragField))
