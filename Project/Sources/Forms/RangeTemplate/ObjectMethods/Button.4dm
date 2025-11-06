/************************************************
Template creation on the sheet 2
This template will be replicate in the cells.
The number of columns must be calculated as accurately as possible for optimum rendering
https://developer.mescius.com/spreadjs/demos/features/cells/range-template/purejs
https://developer.mescius.com/spreadjs/docs/features/cells/celltypes/range-template-cell
https://developer.mescius.com/spreadjs/docs/v18/spreadjs-designer-component/spdesignerwork/setrangetemplatecell
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
VP SET CELL STYLE(VP Cell($area; 1; 1; $sheetTemplate); {backColor: "#919F81"})

VP SET VALUE(VP Cell($area; 0; 2; $sheetTemplate); {value: "Quarter 2"})
VP SET BINDING PATH(VP Cell($area; 1; 2; $sheetTemplate); "Quarter2")
VP SET CELL STYLE(VP Cell($area; 1; 2; $sheetTemplate); {backColor: "#D7913E"})

VP SET VALUE(VP Cell($area; 0; 3; $sheetTemplate); {value: "Quarter 3"})
VP SET BINDING PATH(VP Cell($area; 1; 3; $sheetTemplate); "Quarter3")
VP SET CELL STYLE(VP Cell($area; 1; 3; $sheetTemplate); {backColor: "#CEA722"})

VP SET VALUE(VP Cell($area; 0; 4; $sheetTemplate); {value: "Quarter 4"})
VP SET BINDING PATH(VP Cell($area; 1; 4; $sheetTemplate); "Quarter4")
VP SET CELL STYLE(VP Cell($area; 1; 4; $sheetTemplate); {backColor: "#B58091"})

VP SET FORMULA(VP Cell($area; 2; 0; $sheetTemplate); "=PIESPARKLINE(B2:B5,\"#919F81\",\"#D7913E\",\"CEA722\",\"#B58091\")")
// cell merging
VP ADD SPAN(VP Cells($area; 2; 0; 3; 6; $sheetTemplate))

VP FLUSH COMMANDS($area)


/************************************************
Rendering creation in the sheet 1 based on the template in sheet 2
************************************************/

// loads the context
var $context:=ds:C1482.GraphExample.all().toCollection()

// creation of type based on the template sheet and apply this type to the range in parameter
cs:C1710.VPCellType.new($area).applyTemplateToCells($sheetTemplate; VP Cells($area; 0; 0; 1; 11; $sheetrendering))

var $cellManager:=cs:C1710.VPCellManagement.new($area)
var $i:=0


For each ($item; $context)
	// Adds to each cell the object whose values are to be displayed
	$cellManager.setObjectAsValue(VP Cell($area; 0; $i; $sheetrendering); $item)
	// Adds a page break to print each table on a single page
	VP SET ROW ATTRIBUTES(VP Cell($area; 0; $i; $sheetrendering); {pageBreak: True:C214})
	$i+=1
End for each 

VP COLUMN AUTOFIT(VP Column($area; 0; 1; $sheetrendering))
VP ROW AUTOFIT(VP Row($area; 0; 200; $sheetrendering))






