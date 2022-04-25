//%attributes = {}
#DECLARE($args : Object)

ALERT:C41("Column:"+String:C10($args.col)+" - Row:"+String:C10($args.row))
//TRACE