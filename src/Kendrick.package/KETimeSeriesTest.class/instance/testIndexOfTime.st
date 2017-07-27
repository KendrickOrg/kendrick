tests
testIndexOfTime
	| tmp1 |
	tmp1 := KETimeSeries from: #(2 2 2 5 2) withIndex: #(2 4 6 8).
	self
		assert: (tmp1 indexOfTime: 4) equals: 2;
		assert: (tmp1 indexOfTime: 5) equals: 3