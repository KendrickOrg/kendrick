accessing
allTimesSeriesContaining: arg1
	| tmp1 |
	tmp1 := arg1.
	arg1 isString
		ifTrue: [ tmp1 := (STON fromString: arg1) associations ].
	^ self timeSeries
		select: [ :arg2 | arg2 compartment associations includesAll: tmp1 ]