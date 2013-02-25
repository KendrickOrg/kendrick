tests
testASeriesMultiDimensions
	| s1|
	s1 := KESeries from: #(1 (2 3 4) 5 6 7).
	self assert: (s1 at: 2) size equals: 3.
	