var $concat : cs:C1710.VPConcatDocuments

// select a 4D View document
If (Select document:C905(1; ".4vp"; "Select the data file"; Use sheet window:K24:11)#"")
	$concat:=cs:C1710.VPConcatDocuments.new()
	$concat.addFromObject(VP Export to object("ViewProArea"))
	$concat.addFromFile(Document)
	
	VP IMPORT FROM OBJECT("ViewProArea"; $concat.finalDocument)
End if 

