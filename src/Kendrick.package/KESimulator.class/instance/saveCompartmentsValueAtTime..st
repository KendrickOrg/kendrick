as yet unclassified
saveCompartmentsValueAtTime: arg1
	model population compartments
		keysAndValuesDo: [ :arg2 :arg3 | 
			| tmp1 |
			tmp1 := timeSeries detect: [ :arg4 | arg4 compartment = arg2 ].
			tmp1 add: arg3 atIndex: arg1 ]