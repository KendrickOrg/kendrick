tests
testIndexMax
	| tmp1 tmp2 tmp3 |
	tmp1 := KETimeSeries from: #(4 2 6 8 10).
	self assert: tmp1 indexMax equals: 5.
	tmp2 := KETimeSeries
		from: #(4 2 6 8 10)
		withIndex: #(0.1 0.2 0.3 0.4 0.5).
	self assert: tmp2 indexMax equals: 0.5.
	tmp3 := KETimeSeries from: #(2 5 1 8 2).
	self assert: tmp3 indexMax equals: 4