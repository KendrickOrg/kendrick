accessing
to: aCompartment
	|reader|
	(aCompartment isDictionary) | (aCompartment isSymbol) ifTrue: [ ^ to := aCompartment ].
	(aCompartment isArray) ifTrue: [ ^ to := Dictionary newFrom: aCompartment ].
	(reader := STONReader on: aCompartment readStream) allowComplexMapKeys: true.
	^ to := reader next