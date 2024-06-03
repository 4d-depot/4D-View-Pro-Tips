Class constructor($areaName : Text)
	This:C1470.areaName:=$areaName
	
	
	// Create the header for the JSON schema
	This:C1470.Schema:=New object:C1471
	This:C1470.Schema.$schema:="http://json-schema.org/draft-04/schema#"
	This:C1470.Schema.type:="object"
	This:C1470.Schema.properties:=New object:C1471
	
	// Create the field list of the object past in paramter and show it in the ribbon
Function ShowFieldList($data : Object; $fieldListVisible : Boolean)
	This:C1470.parseObject($data)
	
	// Get the JSON schema
	$JSONSchema:=This:C1470.getJSON()
	
	// JS to load the JSON schema in the UI, and enhance all entries
	$js:="designer.setData('treeNodeFromJson', '"+$JSONSchema+"');"
	If ($fieldListVisible)
		$js+="designer.setData(\"FieldListVisible\", true);"
		$js+="designer.refresh();"
	End if 
	
	// Run the JS
	$answer:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; $js)
	
Function parseObject($attributes : Object; $properties : Object)
	var $attributeName : Text
	
	$properties:=$properties=Null:C1517 ? This:C1470.Schema.properties : $properties
	
	For each ($attributeName; $attributes)
		Case of 
			: (Value type:C1509($attributes[$attributeName])=Is object:K8:27)
				This:C1470._addObject($attributeName; $attributes[$attributeName]; $properties)
			: (Value type:C1509($attributes[$attributeName])=Is collection:K8:32)
				This:C1470._addCollection($attributeName; $attributes[$attributeName]; $properties)
			Else 
				This:C1470._addText($attributeName; $properties)
		End case 
	End for each 
	
	// add a text to the schema
Function _addText($attributeName : Text; $properties : Object)
	// Create the properties with attribute names for the one table
	// But only some customer attributes
	$properties[$attributeName]:=New object:C1471
	$properties[$attributeName].dataFieldType:="text"
	$properties[$attributeName].type:="string"
	
	// add an object to the shema
Function _addObject($objectName : Text; $object : Object; $properties : Object)
	// Create the "table" needed for the related table
	This:C1470._addText($objectName; $properties)
	
	// New object for the related table attributes
	$properties[$objectName].properties:=New object:C1471
	
	This:C1470.parseObject($object; $properties[$objectName].properties)
	
	// add an object collection to the shema
Function _addCollection($collectionName : Text; $collection : Collection; $properties : Object)
	// Create the "table" needed for the related table
	$properties[$collectionName]:=New object:C1471
	$properties[$collectionName].dataFieldType:="table"
	$properties[$collectionName].type:="array"
	
	If (($collection.length>0) && (Value type:C1509($collection[0])=Is object:K8:27))
		
		// New object for the related table attributes
		$properties[$collectionName].items:=New object:C1471("type"; "object")
		$properties[$collectionName].items.properties:=New object:C1471
		
		This:C1470.parseObject($collection[0]; $properties[$collectionName].items.properties)
	End if 
	
	
Function getJSON() : Text
	// Return the schema with the possible attributes for the report
	return JSON Stringify:C1217(This:C1470.Schema)