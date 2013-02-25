tests
testASeriesAtIndexNonExist
	| s2|
	s2 := KESeries from: #(1 2 3 4 5) withIndex:#($a $b $c $d $e).
	self assert: (s2 atIndex: $f) equals: nil.