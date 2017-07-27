tests
testATimeSeriesHasSize5WhenCreatedWithAnArrayOfSize5
	| tmp1 tmp2 |
	tmp1 := KETimeSeries from: #(1 2 3 4 5).
	self assert: tmp1 size equals: 5.
	tmp2 := KETimeSeries from: #(1 2 3 4 5) withIndex: #($a $b $c $d $e).
	self assert: tmp2 size equals: 5