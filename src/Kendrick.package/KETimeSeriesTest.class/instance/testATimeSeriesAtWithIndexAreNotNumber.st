tests
testATimeSeriesAtWithIndexAreNotNumber
	| s1 |
	s1 := KETimeSeries from: #(1 2 3 4 5) withIndex:#($a $b $c $d $f).
	self assert: (s1 at: $a) equals: 1.
	self assert: (s1 at: $b) equals: 2.
	self assert: (s1 at: $c) equals: 3.
	self assert: (s1 at: $d) equals: 4.