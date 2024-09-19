var $area : Text
var $data : Object
var $VPDataContext : cs:C1710.VPDataContext

$area:="ViewProArea"
$data:={\
name: "Jones"; region: "East"; \
numbers: {Phone: "(359) 903-5994"; Mobile: "(799) 621-4540"; Fax: "(467) 725-4056"}; \
sales: [\
{orderDate: "1/6/2013"; item: "Pencil"; units: 95; cost: 1.99; isMakeMoney: True:C214}; \
{orderDate: "4/1/2013"; item: "Binder"; units: 60; cost: 4.99; isMakeMoney: False:C215}; \
{orderDate: "6/8/2013"; item: "Pen Set"; units: 16; cost: 15.99; isMakeMoney: False:C215}\
]\
}

$VPDataContext:=cs:C1710.VPDataContext.new($area)

// set the area data context
VP SET DATA CONTEXT($area; $data)
VP FLUSH COMMANDS($area)

$VPDataContext.ShowFieldList(VP Get data context($area); True:C214)
