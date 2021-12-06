Class constructor()
	
	
	This:C1470.finalDocument:=Null:C1517
	This:C1470.index:=0
	
Function addFromFile($path : Text)
	$currentDoc:=This:C1470._documentToObject($path)
	This:C1470.addFromObject($currentDoc)
	
Function addFromObject($currentDoc : Object)
	If (This:C1470.finalDocument=Null:C1517)
		This:C1470.finalDocument:=$currentDoc
	Else 
		This:C1470.index:=This:C1470._sheetsCount(This:C1470.finalDocument)
		
		This:C1470._copySheets($currentDoc)
		This:C1470._copyNamedStyles($currentDoc)
		This:C1470._copyNames($currentDoc)
		
		This:C1470.finalDocument.spreadJS.sheetCount:=This:C1470._sheetsCount(This:C1470.finalDocument)
		This:C1470.finalDocument.spreadJS.activeSheetIndex:=0
	End if 
	
Function _sheetsCount($currentDoc : Object)->$count : Integer
	var $sheet : Text
	
	For each ($sheet; $currentDoc.spreadJS.sheets)
		$count:=$count+1
	End for each 
	
	
Function _documentToObject($path : Text)->$result : Object
	
	$result:=JSON Parse:C1218(Document to text:C1236($path))
	
	
Function _copySheets($currentDoc : Object)
	var $sheet : Text
	
	For each ($sheet; $currentDoc.spreadJS.sheets)
		//name of the new sheet
		If (This:C1470.finalDocument.spreadJS.sheets[$sheet]=Null:C1517)
			$nameSheet:=$sheet
		Else 
			$nameSheet:="Sheet"+String:C10(This:C1470.index+1)
			$currentDoc.spreadJS.sheets[$sheet].name:=$nameSheet
		End if 
		$currentDoc.spreadJS.sheets[$sheet].index:=This:C1470.index
		This:C1470.index:=This:C1470.index+1
		// create new sheet
		This:C1470.finalDocument.spreadJS.sheets[$nameSheet]:=$currentDoc.spreadJS.sheets[$sheet]
	End for each 
	
	
Function _copyNamedStyles($currentDoc : Object)
	
	If ($currentDoc.spreadJS.namedStyles#Null:C1517)
		If (This:C1470.finalDocument.spreadJS.namedStyles#Null:C1517)
			This:C1470.finalDocument.spreadJS.namedStyles.concat($currentDoc.spreadJS.namedStyles)
		Else 
			This:C1470.finalDocument.spreadJS.namedStyles:=$currentDoc.spreadJS.namedStyles
		End if 
	End if 
	
	
Function _copyNames($currentDoc : Object)
	
	If ($currentDoc.spreadJS.names#Null:C1517)
		If (This:C1470.finalDocument.spreadJS.names#Null:C1517)
			This:C1470.finalDocument.spreadJS.names.concat($currentDoc.spreadJS.names)
		Else 
			This:C1470.finalDocument.spreadJS.names:=$currentDoc.spreadJS.names
		End if 
	End if 
	
	