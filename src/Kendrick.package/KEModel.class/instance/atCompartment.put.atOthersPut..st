accessing
atCompartment: keyInput put: aNumber1 atOthersPut: aNumber2
	| key |
	keyInput isDictionary | keyInput isSymbol
		ifTrue: [ key := keyInput ].
	keyInput isArray
		ifTrue: [ key := Dictionary newFrom: keyInput ].
	keyInput isString
		ifTrue: [ key := ((STONReader on: keyInput readStream)
				allowComplexMapKeys: true) next ].
	self initCompartments
		keysDo: [ :k | 
			k = key
				ifTrue: [ self atCompartment: k put: aNumber1 ]
				ifFalse: [ self atCompartment: k put: aNumber2 ] ]