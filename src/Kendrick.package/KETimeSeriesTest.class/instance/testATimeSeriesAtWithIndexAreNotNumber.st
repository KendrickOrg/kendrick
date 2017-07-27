tests
testATimeSeriesAtWithIndexAreNotNumber
	| tmp1 |
	tmp1 := KETimeSeries from: #(1 2 3 4 5) withIndex: #($a $b $c $d $f).
	self
		assert: (tmp1 at: $a) equals: 1;
		assert: (tmp1 at: $b) equals: 2;
		assert: (tmp1 at: $c) equals: 3;
		assert: (tmp1 at: $d) equals: 4