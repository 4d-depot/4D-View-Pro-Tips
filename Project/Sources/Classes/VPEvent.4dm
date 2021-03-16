Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	
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
	
	var $answer : Text
	
	$js:="Utils.spread.options.allowContextMenu=false; "
	$js:=$js+"Utils.spread.getHost().addEventListener('contextmenu', function (e){"
	$js:=$js+"var offset = $('#ss').offset();"
	$js:=$js+"var x = e.pageX - offset.left;"
	$js:=$js+"var y = e.pageY - offset.top;"
	$js:=$js+"var target = Utils.spread.getActiveSheet().hitTest(x, y);"
	
	$js:=$js+"$4d."+$methodName+"(target); "
	$js:=$js+"e.preventDefault(); "
	$js:=$js+"return false; "
	$js:=$js+"  });"
	
	$answer:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; $js)
	