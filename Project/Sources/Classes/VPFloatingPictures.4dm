Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	This:C1470.activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
	
	
	// Gets the list of all the floating picture of the active sheet
	// To know which picture is selected, the objects returns contains the isSelected attribut 
Function Names()->$names : Collection
	var $js : Text
	
	$js:="(function (){"
	$js:=$js+This:C1470.activeSheet
	$js:=$js+"var names = [];"
	$js:=$js+"activeSheet.pictures.all().forEach(function (item){names.push({name:item.name(),isSelected:item.isSelected()});});"
	$js:=$js+"return names;})();"
	
	$names:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js; Is collection:K8:32)
	
	// Add a new picture in the current sheet
Function Add($name : Text; $posixPath : Text; $x : Integer; $y : Integer; $width : Integer; $height : Integer)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.pictures.add('"+$name+"','"+$posixPath+"',"+String:C10($x)+","+String:C10($y)+","+String:C10($width)+","+String:C10($height)+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	// Removes a floating picture from the active sheet by the indicate name. 
Function Remove($name : Text)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"activeSheet.pictures.remove('"+$name+"');"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the stretch of the picture from the active sheet by the indicate name.
	//$strectType = 0: "stretch", 1: "center", 2: "zoom", 3: "none",
Function Stretch($name : Text; $strectType : Integer)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.pictureStretch("+String:C10($strectType)+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the width of the picture from the active sheet by the indicate name.
Function Width($name : Text; $width : Integer)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.width("+String:C10($width)+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the height of the picture from the active sheet by the indicate name.
Function Height($name : Text; $height : Integer)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.height("+String:C10($height)+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the x position in pixel of the picture from the active sheet by the indicate name.
Function X($name : Text; $x : Integer)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.x("+String:C10($x)+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the y position in pixel of the picture from the active sheet by the indicate name.
Function Y($name : Text; $y : Integer)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.y("+String:C10($y)+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the border style of the picture from the active sheet by the indicate name.
	//$style='none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset', 'initial', or 'inherit'.
Function BorderStyle($name : Text; $style : Text)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.borderStyle('"+$style+"');"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the back color of the picture from the active sheet by the indicate name.
Function BackColor($name : Text; $color : Text)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.backColor('"+$color+"');"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the border color of the picture from the active sheet by the indicate name.
Function BorderColor($name : Text; $color : Text)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.borderColor('"+$color+"');"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	//Sets the border width of the picture from the active sheet by the indicate name.
Function BorderWidth($name : Text; $width : Integer)
	var $js; $answer : Text
	
	$js:=This:C1470.activeSheet
	$js:=$js+"pict=activeSheet.pictures.get('"+$name+"');"
	$js:=$js+"pict.borderWidth("+String:C10($width)+");"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
	