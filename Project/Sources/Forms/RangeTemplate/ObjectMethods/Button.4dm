/************************************************
Template creation on the sheet 2
************************************************/
var $area:="ViewProArea"
var $sheetTemplate:=1
var $sheetRendering:=0

VP SET SHEET COUNT($area; 2)
VP SET SHEET NAME($area; "Template"; $sheetTemplate)
VP SET SHEET NAME($area; "Rendering"; $sheetrendering)

VP SET COLUMN COUNT($area; 5; $sheetTemplate)
VP SET ROW COUNT($area; 6; $sheetTemplate)


VP SET BINDING PATH(VP Cell($area; 0; 0; $sheetTemplate); "Label")
VP SET VALUE(VP Cell($area; 0; 1; $sheetTemplate); {value: "Quarter 1"})
VP SET BINDING PATH(VP Cell($area; 1; 1; $sheetTemplate); "Quarter1")
VP SET VALUE(VP Cell($area; 0; 2; $sheetTemplate); {value: "Quarter 2"})
VP SET BINDING PATH(VP Cell($area; 1; 2; $sheetTemplate); "Quarter2")
VP SET VALUE(VP Cell($area; 0; 3; $sheetTemplate); {value: "Quarter 3"})
VP SET BINDING PATH(VP Cell($area; 1; 3; $sheetTemplate); "Quarter3")
VP SET VALUE(VP Cell($area; 0; 4; $sheetTemplate); {value: "Quarter 4"})
VP SET BINDING PATH(VP Cell($area; 1; 4; $sheetTemplate); "Quarter4")

VP SET FORMULA(VP Cell($area; 2; 0; $sheetTemplate); "=PIESPARKLINE(A1:B5,\"#919F81\",\"#D7913E\",\"CEA722\",\"#B58091\")")
// cell merging
VP ADD SPAN(VP Cells($area; 2; 0; 3; 6; $sheetTemplate))

VP FLUSH COMMANDS($area)


/************************************************
Rendering creation in the sheet 1 based on the template in sheet 2
************************************************/

// loads the context
var $context:=ds:C1482.GraphExample.all().toCollection()


cs:C1710.VPCellType.new("ViewProArea").applyTemplateToCells($sheetTemplate; VP Cells("ViewProArea"; 0; 0; 1; 10; $sheetrendering))

var $cellManager:=cs:C1710.VPCellManagement.new("ViewProArea")
var $i:=0

For each ($item; $context)
	$cellManager.setObjectAsValue(VP Cell("ViewProArea"; 0; $i; $sheetrendering); $item)
	VP SET ROW ATTRIBUTES(VP Cell("ViewProArea"; 0; $i; $sheetrendering); {pageBreak: True:C214})
	$i+=1
	If ($i>9)
		break
	End if 
End for each 

VP COLUMN AUTOFIT(VP Column("ViewProArea"; 0; 1; $sheetrendering))
VP ROW AUTOFIT(VP Row("ViewProArea"; 0; 200; $sheetrendering))






