tests
testASeriesIndexMax
	| s1 s2 |
	s1 := KESeries from: #(4 2 6 8 10).
	self assert: (s1 indexMax) equals: 5.
	s2 := KESeries from: #(4 2 6 8 10) withIndex:#(0.1 02 0.3 0.4 0.5).
	self assert: (s2 indexMax) equals: 0.5