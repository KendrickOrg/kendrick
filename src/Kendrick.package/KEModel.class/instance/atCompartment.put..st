as yet unclassified
atCompartment: arg1 put: arg2
	| tmp1 |
	arg1 isDictionary | arg1 isSymbol
		ifTrue: [ tmp1 := arg1 ].
	arg1 isArray
		ifTrue: [ tmp1 := Dictionary newFrom: arg1 ].
	arg1 isString
		ifTrue: [ tmp1 := ((STONReader on: arg1 readStream) allowComplexMapKeys: true)
				next ].
	self initCompartments
		at: tmp1
		ifAbsent: [ (self compartmentNames includes: tmp1)
				ifFalse: [ ^ self error: 'No compartment names: ' , tmp1 asString ].
			initCompartments := Dictionary
				newFrom: (self compartmentNames collect: [ :arg3 | arg3 -> 0 ]) ].
	population initialSize < (initCompartments values sum + arg2)
		ifTrue: [ ^ self
				error: 'Total size of compartments is greater than the population size' ].
	initCompartments at: tmp1 put: arg2.
	population compartments: initCompartments