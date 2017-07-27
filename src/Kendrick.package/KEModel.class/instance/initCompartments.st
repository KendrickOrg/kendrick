accessing
initCompartments
	initCompartments
		ifNil: [ initCompartments := Dictionary
				newFrom: (self compartmentNames collect: [ :arg1 | arg1 -> 0 ]) ].
	^ initCompartments