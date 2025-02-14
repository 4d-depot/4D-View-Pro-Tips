
var $dropDowns:=[]
$dropDowns[0]:={type: 4}  //GC.Spread.Sheets.DropDownType.list
$dropDowns[0].option:={\
items: \
[\
{text: "item1"; value: "item1"}; \
{text: "item2"; value: "item2"}; \
{text: "item3"; value: "item3"}; \
{text: "item4"; value: "item4"}\
]\
}

cs:C1710.VPCellType.new("ViewProArea").addDropDown(VP Get selection("ViewProArea"); "openList"; $dropDowns)

