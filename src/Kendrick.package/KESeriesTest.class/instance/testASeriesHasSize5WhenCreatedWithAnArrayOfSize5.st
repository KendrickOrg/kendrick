tests
testASeriesHasSize5WhenCreatedWithAnArrayOfSize5
	| s1 s2|
	s1 := KESeries from: #(1 2 3 4 5).
	self assert: s1 size equals: 5.
	s2 := KESeries from: #(1 2 3 4 5) withIndex:#($a $b $c $d $e).
	self assert: s2 size equals: 5.