tests
testIndexMax
	| s1 s2 s3|
	s1 := KETimeSeries from: #(4 2 6 8 10).
	self assert: (s1 indexMax) equals: 5.
	s2 := KETimeSeries from: #(4 2 6 8 10) withIndex:#(0.1 0.2 0.3 0.4 0.5).
	self assert: (s2 indexMax) equals: 0.5.
	s3 := KETimeSeries from: #(2 5 1 8 2).
	self assert: (s3 indexMax) equals: 4