tests
testAt
	| tmp1 tmp2 |
	tmp1 := KETimeSeries from: #(2 2 2 2 2).
	self assert: (tmp1 at: 3) equals: 2.
	tmp2 := KETimeSeries from: #(2 2 2 5 2) withIndex: #(2 4 6 8).
	self assert: (tmp2 at: 4) equals: 2