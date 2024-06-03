//%attributes = {}
ARRAY TEXT:C222(_TabTitles; 0)

APPEND TO ARRAY:C911(_TabTitles; "VPCellManagement")
APPEND TO ARRAY:C911(_TabTitles; "VPCurrentSheet")
APPEND TO ARRAY:C911(_TabTitles; "VPDocument")
APPEND TO ARRAY:C911(_TabTitles; "VPFloatingPictures")
APPEND TO ARRAY:C911(_TabTitles; "VPNavigation")
APPEND TO ARRAY:C911(_TabTitles; "VPRangeGrouping")
APPEND TO ARRAY:C911(_TabTitles; "VPSort")
APPEND TO ARRAY:C911(_TabTitles; "VPConcatDocuments")
APPEND TO ARRAY:C911(_TabTitles; "VPEvent")
If (Application version:C493>="1950")
	APPEND TO ARRAY:C911(_TabTitles; "VPRules")
End if 
APPEND TO ARRAY:C911(_TabTitles; "VPComments")
APPEND TO ARRAY:C911(_TabTitles; "VPDataContext")
APPEND TO ARRAY:C911(_TabTitles; "VPHeader")
Form:C1466.dragField:=""
