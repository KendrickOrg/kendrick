tests
testASeriesAtIndex
	| s1 s2 |
	s1 := KESeries from: #(1 1 1 1 1).
	self assert: (s1 atIndex: 3) equals: 1.
	s2 := KESeries from: #(1 1 1 1 1) withIndex:#($a $b $c $d).
	self assert: (s2 atIndex: $a) equals: 1