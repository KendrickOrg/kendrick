tests
testIndexOfTime
	| s2 |
	s2 := KETimeSeries from: #(2 2 2 5 2) withIndex:#(2 4 6 8).
	self assert: (s2 indexOfTime: 4) equals: 2.
	self assert: (s2 indexOfTime: 5) equals: 3.