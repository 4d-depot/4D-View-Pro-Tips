Class constructor()
	
Function cleanObject($object : Object) : Boolean
	var $result : Boolean
	$result:=False:C215
	
	If (Value type:C1509($object.spreadJS)=Is object:K8:27)
		If (Value type:C1509($object.spreadJS.sheets)=Is object:K8:27)
			ARRAY TEXT:C222($arraySheetNames; 0)
			OB GET PROPERTY NAMES:C1232($object.spreadJS.sheets; $arraySheetNames)
			var $i : Integer
			For ($i; 1; Size of array:C274($arraySheetNames))
				var $sheet : Object
				$sheet:=$object.spreadJS.sheets[$arraySheetNames{$i}]
				
				If (Value type:C1509($sheet.data)=Is object:K8:27)
					If (Value type:C1509($sheet.data.dataTable)=Is object:K8:27)
						var $dataTable : Object
						$dataTable:=$sheet.data.dataTable
						
						ARRAY TEXT:C222($arrayColumnsNames; 0)
						OB GET PROPERTY NAMES:C1232($dataTable; $arrayColumnsNames)
						var $j : Integer
						For ($j; 1; Size of array:C274($arrayColumnsNames))
							var $column : Object
							$column:=$dataTable[$arrayColumnsNames{$j}]
							
							ARRAY TEXT:C222($arrayRowsNames; 0)
							OB GET PROPERTY NAMES:C1232($column; $arrayRowsNames)
							var $k : Integer
							For ($k; 1; Size of array:C274($arrayRowsNames))
								var $cell : Object
								$cell:=$column[$arrayRowsNames{$k}]
								
								If (Value type:C1509($cell.style)=Is object:K8:27)
									If (Value type:C1509($cell.style.formatter)=Is text:K8:3)
										var $formatter : Text
										$formatter:=$cell.style.formatter
										
										If (Position:C15("@"; $formatter)#0)
											If (Position:C15(";"; $formatter)#0)
												$cell.style.formatter:="@"
												$result:=True:C214
											End if 
										End if 
									End if 
								End if 
							End for 
						End for 
					End if 
				End if 
			End for 
		End if 
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