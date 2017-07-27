accessing
compartments: arg1
	| tmp1 tmp2 |
	self compartments ifNil: [ compartments := Dictionary new ].
	arg1 isDictionary
		ifTrue: [ tmp1 := arg1 ]
		ifFalse: [ tmp2 := STONReader on: arg1 readStream.
			tmp2 allowComplexMapKeys: true.
			tmp1 := tmp2 next ].
	tmp1
		keysAndValuesDo: [ :arg2 :arg3 | compartments at: arg2 put: arg3 ]