accessing
atCompartment: arg1 put: arg2 atOthersPut: arg3
	| tmp1 |
	arg1 isDictionary | arg1 isSymbol
		ifTrue: [ tmp1 := arg1 ].
	arg1 isArray
		ifTrue: [ tmp1 := Dictionary newFrom: arg1 ].
	arg1 isString
		ifTrue: [ tmp1 := ((STONReader on: arg1 readStream) allowComplexMapKeys: true)
				next ].
	self initCompartments
		keysDo: [ :arg4 | 
			arg4 = tmp1
				ifTrue: [ self atCompartment: arg4 put: arg2 ]
				ifFalse: [ self atCompartment: arg4 put: arg3 ] ]