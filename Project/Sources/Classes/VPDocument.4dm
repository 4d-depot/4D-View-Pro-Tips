Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	
	//  Creation example of a new culture nl-NL
Function customCulture()
	var $js; $answer : Text
	
	$js:="var myCulture=new GC.Spread.Common.CultureInfo();"
	$js:=$js+"myCulture.NumberFormat.currencySymbol='€';"
	$js:=$js+"myCulture.NumberFormat.numberDecimalSeparator=',';"
	$js:=$js+"myCulture.NumberFormat.numberGroupSeparator='.';"
	$js:=$js+"myCulture.NumberFormat.arrayGroupSeparator=';';"
	$js:=$js+"myCulture.NumberFormat.arrayListSeparator=' << ';"
	$js:=$js+"myCulture.NumberFormat.listSeparator=';';"
	$js:=$js+"myCulture.DateTimeFormat.amDesignator='';"
	$js:=$js+"myCulture.DateTimeFormat.pmDesignator='';"
	$js:=$js+"myCulture.DateTimeFormat.abbreviatedMonthNames=['jan','feb','mrt','apr','mei','jun','jul','aug','sep','okt','nov','dec',''];"
	$js:=$js+"myCulture.DateTimeFormat.abbreviatedDayNames=['zo','ma','di','wo','do','vr','za'];"
	$js:=$js+"myCulture.DateTimeFormat.abbreviatedMonthGenitiveNames=['jan','feb','mrt','apr','mei','jun','jul','aug','sep','okt','nov','dec',''];"
	$js:=$js+"myCulture.DateTimeFormat.dayNames=['zondag','maandag','dinsdag','woensdag','donderdag','vrijdag','zaterdag'];"
	$js:=$js+"myCulture.DateTimeFormat.fullDateTimePattern='dddd d MMMM yyyy HH:mm:ss';"
	$js:=$js+"myCulture.DateTimeFormat.longDatePattern='dddd, d.MMMM yyyy';"
	$js:=$js+"myCulture.DateTimeFormat.longTimePattern='HH:mm:ss';"
	$js:=$js+"myCulture.DateTimeFormat.monthDayPattern='dd MMMM';"
	$js:=$js+"myCulture.DateTimeFormat.monthNames=['januari','februari','maart','april','mei','juni','juli','augustus','september','oktober','november','december',''];"
	$js:=$js+"myCulture.DateTimeFormat.monthGenitiveNames=['januari','februari','maart','april','mei','juni','juli','augustus','september','oktober','november','december',''];"
	$js:=$js+"myCulture.DateTimeFormat.shortDatePattern='d-M-yyyy';"
	$js:=$js+"myCulture.DateTimeFormat.shortTimePattern='HH:mm';"
	$js:=$js+"myCulture.DateTimeFormat.yearMonthPattern='MMMM yyyy';"
	//add one culture
	$js:=$js+"GC.Spread.Common.CultureManager.addCultureInfo('nl-NL',myCulture);"
	//switch to 'nl-NL' culture
	$js:=$js+"GC.Spread.Common.CultureManager.culture('nl-NL');"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Clear the undo list. 
	// All the modifications done until the call of clearUndoList will be lost.
Function clearUndoList()
	var $answer : Text
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; "Utils.spread.undoManager().clear()")
	
	
	// Undoes the last command.
Function undo()
	var $answer : Text
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; "Utils.spread.undoManager().undo()")
	
	// Redoes the last command.
Function redo()
	var $answer : Text
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; "Utils.spread.undoManager().redo()")
	
	// Changes the visibily of the ribbon
Function hideRibbon($hide : Boolean)
	var $js; $answer : Text
	
	If (Bool:C1537($hide))
		$js:="document.getElementsByClassName('ribbon')[0].setAttribute('style','display: none');"
	Else 
		$js:="document.getElementsByClassName('ribbon')[0].setAttribute('style','display: block');"
	End if 
	$js:=$js+"window.dispatchEvent(new Event('resize'));"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Hides / shows the shet tab in your document
Function hideSheetTabs($hide : Boolean)
	var $js; $answer : Text
	
	$js:="Utils.spread.options.tabStripVisible  = "+Choose:C955(Bool:C1537($hide); "false"; "true")+";"
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Hides / shows the button to add new tab to your document
Function hideNewSheetButton($hide : Boolean)
	var $js; $answer : Text
	
	$js:="Utils.spread.options.newTabVisible  = "+Choose:C955(Bool:C1537($hide); "false"; "true")+";"
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	