Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	
	This:C1470._getOffset()
	
	// Copy the style of the original column/row during insertion
Function insertColumnAndRowWithStyle()
	var $js; $answer : Text
	
	// Gestion de l'insertion de lignes
	$js:="Utils.spread.bind(GC.Spread.Sheets.Events.RowChanged, function(sender, args){"
	$js:=$js+"if (args.propertyName=='addRows'){"
	$js:=$js+"var fromRange=[new GC.Spread.Sheets.Range(args.row+args.count, -1, args.count, -1)];"
	$js:=$js+"var toRange=[new GC.Spread.Sheets.Range(args.row, -1, args.count, -1)];"
	$js:=$js+"spread.commandManager().execute({cmd: 'clipboardPaste', sheetName: args.sheetName, fromSheet: args.sheet, fromRanges: fromRange, pastedRanges: toRange, isCutting: false, clipboardText: '', pasteOption: GC.Spread.Sheets.ClipboardPasteOptions.formatting"+"});"
	$js:=$js+"}"
	$js:=$js+"});"
	
	// Gestion de l'insertion de colonnes
	$js:=$js+"Utils.spread.bind(GC.Spread.Sheets.Events.ColumnChanged, function(sender, args){"
	$js:=$js+"if (args.propertyName=='addColumns'){"
	$js:=$js+"var fromRange=[new GC.Spread.Sheets.Range(-1, args.col+args.count, -1, args.count)];"
	$js:=$js+"var toRange=[new GC.Spread.Sheets.Range(-1, args.col, -1, args.count)];"
	$js:=$js+"spread.commandManager().execute({cmd: 'clipboardPaste', sheetName: args.sheetName, fromSheet: args.sheet, fromRanges: fromRange, pastedRanges: toRange, isCutting: false, clipboardText: '', pasteOption: GC.Spread.Sheets.ClipboardPasteOptions.formatting"+"});"
	$js:=$js+"}"
	$js:=$js+"});"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Disables the context menu and calls the method "$methodName" when user does a right click
Function rightClickEvent($methodName : Text)
	var $js; $answer : Text
	
	//$js:=This._getOffset()
	$js:=This:C1470._getId()
	$js:=$js+"Utils.spread.options.allowContextMenu=false; "
	$js:=$js+"Utils.spread.getHost().addEventListener('contextmenu', function (e){"
	$js:=$js+"var offset = getOffset(document.getElementById(id));"
	$js:=$js+"var x = e.pageX - offset.left;"
	$js:=$js+"var y = e.pageY - offset.top;"
	$js:=$js+"var target = Utils.spread.getActiveSheet().hitTest(x, y);"
	
	$js:=$js+"$4d."+$methodName+"(target); "
	$js:=$js+"e.preventDefault(); "
	$js:=$js+"return false; "
	$js:=$js+"  });"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Calls the method "$methodName" when user drop someting from an exterior field
Function dropEvent($methodName : Text)
	var $js; $answer : Text
	
	// block the default dragover
	//$js:=This._getOffset()
	$js:=This:C1470._getId()
	$js:=$js+"document.getElementById(id).addEventListener(\"dragover\", function(event) {    event.preventDefault();  }, false);"
	
	$js:=$js+"document.getElementById(id).addEventListener(\"drop\", function( e ) {"
	$js:=$js+"var offset = getOffset(document.getElementById(id));"
	$js:=$js+"var x = e.pageX - offset.left;"
	$js:=$js+"var y = e.pageY - offset.top;"
	$js:=$js+"var target = Utils.spread.getActiveSheet().hitTest(x, y);"
	$js:=$js+"$4d."+$methodName+"(target);"
	$js:=$js+"event.preventDefault();"
	$js:=$js+"}"
	$js:=$js+", false);"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function ColumnChanged($methodName : Text)
	var $js; $answer : Text
	
	$js+="activeSheet=Utils.spread.getActiveSheet();"
	$js+="activeSheet.bind(GC.Spread.Sheets.Events.ColumnChanged, function (e, info) {"
	$js+="    if(info.sheetArea === GC.Spread.Sheets.SheetArea.viewport){"
	$js+="       $4d."+$methodName+"(info);"
	$js+="    }"
	$js+="});"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function RowChanged($methodName : Text)
	var $js; $answer : Text
	
	$js+="activeSheet=Utils.spread.getActiveSheet();"
	$js+="activeSheet.bind(GC.Spread.Sheets.Events.RowChanged, function (e, info) {"
	$js+="    if(info.sheetArea === GC.Spread.Sheets.SheetArea.viewport){"
	$js+="       $4d."+$methodName+"(info);"
	$js+="    }"
	$js+="});"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function _getId()->$js : Text
	If (Application version:C493>="1950")
		$js:="var id=(useRibbon)?'vp_vp':'ssvp_vp';"
	Else 
		$js:="var id='ssvp_vp';"
	End if 
	
	//Get the current coordinates of the element relative to the document.
Function _getOffset()
	// Code to replace the offset command in JQuery
	var $js; $answer : Text
	
	$js:="function getOffset(element)"
	$js:=$js+"{"
	$js:=$js+"    if (!element.getClientRects().length)"
	$js:=$js+"    {"
	$js:=$js+"      return { top: 0, left: 0 };"
	$js:=$js+"    }"
	$js:=$js+"    let rect = element.getBoundingClientRect();"
	$js:=$js+"    let win = element.ownerDocument.defaultView;"
	$js:=$js+"    return ("
	$js:=$js+"    {"
	$js:=$js+"      top: rect.top + win.pageYOffset,"
	$js:=$js+"      left: rect.left + win.pageXOffset"
	$js:=$js+"    });"
	$js:=$js+"}"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	