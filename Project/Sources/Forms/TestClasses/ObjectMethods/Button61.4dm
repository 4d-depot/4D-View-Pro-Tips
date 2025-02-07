var $range:=cs:C1710.VPCurrentSheet.new("ViewProArea").cellLetterToRange("E:F")

//var $range:=cs.VPCurrentSheet.new("ViewProArea").cellLetterToRange(cs.VPRangeReader.new(VP Get selection("ViewProArea")).toLetter())
//var $letter:=cs.VPRangeReader.new(VP Get selection("ViewProArea")).toLetter()
//var $range:=cs.VPCurrentSheet.new("ViewProArea").cellLetterToRange($letter)

VP SET SELECTION($range)
