property activeSheet:="var activeSheet=Utils.spread.getActiveSheet();"
property areaName:=""

Class constructor($areaName : Text)
	
	This:C1470.areaName:=$areaName
	
Function pictureCell($cell : Object)
	// Creation of a custom cell type to display the picture as background image 
	// This custom cell type must be apply on all the cell where an image need to be displayed
	
	var $answer; $js : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	$js:="function PictureCellType() {"
	$js+="    this.typeName = 'ImageCellType';"
	$js+="}"
	$js+="PictureCellType.prototype = new GC.Spread.Sheets.CellTypes.Base();"
	$js+="PictureCellType.prototype.paint = function (ctx, value, x, y, w, h, style, context) {"
	$js+="    style.backgroundImage = String(value);"
	$js+="    style.backgroundImageLayout = GC.Spread.Sheets.ImageLayout.stretch;"
	$js+="    GC.Spread.Sheets.CellTypes.Text.prototype.paint.apply(this, [ctx, '', x, y, w, h, style, context]);"
	$js+="};"
	$js+="var pictureCellType = new PictureCellType(); "
	$js+="Utils.currentSheet.getRange("+String:C10($range.row())+","+String:C10($range.column())+","+String:C10($range.rowCount())+","+String:C10($range.columnCount())+").cellType(pictureCellType);"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	
Function secondToTimeFormatter($cell : Object)
	// Displays a duration in seconds in HH:MM:SS format in the cell
	
	var $answer; $js : Text
	var $range : cs:C1710.VPRangeReader
	
	$range:=cs:C1710.VPRangeReader.new($cell)
	
	$js:="function CustomTimeFormatter() {this.typeName = 'SecondToTimeCellType';}"
	$js+="CustomTimeFormatter.prototype = new GC.Spread.Formatter.FormatterBase();"
	$js+="CustomTimeFormatter.prototype.format = function (obj, formattedData) {"
	$js+="let seconds = Number(obj);"
	$js+="if (isNaN(seconds) || seconds < 0) return obj != null ? obj.toString() : '';"
	$js+="let hrs = Math.floor(seconds / 3600);"
	$js+="let mins = Math.floor((seconds % 3600) / 60);"
	$js+="let secs = Math.floor(seconds % 60);"
	$js+="return ("
	$js+="hrs.toString().padStart(2, '0') +"
	$js+="':' +"
	$js+="mins.toString().padStart(2, '0') +"
	$js+="':' +"
	$js+="secs.toString().padStart(2, '0')"
	$js+=");"
	$js+="};"
	$js+="CustomTimeFormatter.prototype.parse = function (str) {"
	$js+="return new GC.Spread.Formatter.GeneralFormatter().parse(str);"
	$js+="};"
	$js+="var timeFormatter = new CustomTimeFormatter();"
	$js+="Utils.currentSheet.getRange("+String:C10($range.row())+","+String:C10($range.column())+","+String:C10($range.rowCount())+","+String:C10($range.columnCount())+").formatter(timeFormatter);"
	
	$answer:=WA Evaluate JavaScript:C1029(*; This:C1470.areaName; $js)
	