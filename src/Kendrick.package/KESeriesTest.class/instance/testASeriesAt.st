tests
testASeriesAt
	| s1 s2 |
	s1 := KESeries from: #(2 2 2 2 2).
	self assert: (s1 at: 3) equals: 2.
	s2 := KESeries from: #(2 2 2 2 2) withIndex:#(2 4 6 8).
	self assert: (s2 at: 4) equals: 2.
