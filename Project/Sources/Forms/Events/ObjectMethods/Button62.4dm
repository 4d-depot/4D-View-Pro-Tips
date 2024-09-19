var $range:=cs:C1710.VPCurrentSheet.new("ViewProArea").cellLetterToRange("2:12")

//var $range:=cs.VPCurrentSheet.new("ViewProArea").cellLetterToRange(cs.VPRangeReader.new(VP Get selection("ViewProArea")).toLetter())
//var $letter:=cs.VPRangeReader.new(VP Get selection("ViewProArea")).toLetter()
//var $range:=cs.VPCurrentSheet.new("ViewProArea").cellLetterToRange($letter)

VP SET SELECTION($range)
