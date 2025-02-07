$range:=VP Get selection("ViewProArea")

$comment:=cs:C1710.VPComments.new("ViewProArea").get($range)
If ($comment#Null:C1517)
	ALERT:C41($comment.text)
Else 
	ALERT:C41("No comment available")
End if 
