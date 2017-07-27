tests
testIndexMin
	| tmp1 tmp2 |
	tmp1 := KETimeSeries from: #(4 2 6 8 10).
	self assert: tmp1 indexMin equals: 2.
	tmp2 := KETimeSeries
		from: #(4 2 6 8 10)
		withIndex: #(0.1 0.2 0.3 0.4 0.5).
	self assert: tmp2 indexMin equals: 0.2