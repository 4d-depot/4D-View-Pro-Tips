$ref:=Open document:C264("")
If (ok=1)
	CLOSE DOCUMENT:C267($ref)
	
	var $file : 4D:C1709.File
	
	$file:=File:C1566(document; fk platform path:K87:2)
	
	var cleaner : cs:C1710.VPDocumentCleaner
	
	cleaner:=cs:C1710.VPDocumentCleaner.new()
	cleaner.cleanFile($file)
	
End if 