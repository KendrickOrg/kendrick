as yet unclassified
benchmark: arg1 times: arg2
	| tmp1 tmp2 tmp3 |
	tmp1 := [ (1 to: arg2)
		collect: [ :arg3 | Time millisecondsToRun: arg1 ] ]
		valueUnpreemptively.
	tmp2 := tmp1 average asFloat.
	tmp3 := ((tmp1 detectSum: [ :arg4 | (arg4 - tmp2) * (arg4 - tmp2) ])
		/ tmp1 size) sqrt.
	^ Array with: tmp2 with: tmp3