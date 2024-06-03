Class constructor()
	
Function cleanObject($object : Object) : Boolean
	var $result : Boolean
	var $sheets; $columns; $cells; $cell : Object
	var $sheetName; $columnName; $cellName : Text
	var $formatter : Text
	
	$result:=False:C215
	
	If ((Value type:C1509($object.spreadJS)=Is object:K8:27) && \
		(Value type:C1509($object.spreadJS.sheets)=Is object:K8:27))
		
		$sheets:=$object.spreadJS.sheets
		
		For each ($sheetName; $sheets)
			
			If ((Value type:C1509($sheets[$sheetName].data)=Is object:K8:27) && \
				(Value type:C1509($sheets[$sheetName].data.dataTable)=Is object:K8:27))
				
				$columns:=$sheets[$sheetName].data.dataTable
				
				If (Value type:C1509($columns)=Is object:K8:27)
					
					For each ($columnName; $columns)
						
						$cells:=$columns[$columnName]
						
						If (Value type:C1509($cells)=Is object:K8:27)
							
							For each ($cellName; $cells)
								
								$cell:=$cells[$cellName]
								
								If ((Value type:C1509($cell)=Is object:K8:27) && \
									(Value type:C1509($cell.style)=Is object:K8:27) && \
									(Value type:C1509($cell.style.formatter)=Is text:K8:3))
									
									$formatter:=$cell.style.formatter
									
									If ((Position:C15("@"; $formatter)#0) && \
										(Position:C15(";"; $formatter)#0))
										$cell.style.formatter:="@"
										$result:=True:C214
									End if 
									
								End if 
								
							End for each 
							
						End if 
						
					End for each 
					
				End if 
				
			End if 
			
		End for each 
		
	End if 
	
	return $result
	
	
Function cleanFile($file : 4D:C1709.File)
	If ($file.exists)
		var $content : Text
		$content:=$file.getText()
		
		var $object : Object
		$object:=JSON Parse:C1218($content)
		
		If (This:C1470.cleanObject($object))
			$content:=JSON Stringify:C1217($object)
			$file.setText($content)
		End if 
		
	End if 