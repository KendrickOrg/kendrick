accessing
to: aCompartment
	|reader|
	(aCompartment isDictionary) | (aCompartment isSymbol) ifTrue: [ ^ to := aCompartment ].
	(reader := STONReader on: aCompartment readStream) allowComplexMapKeys: true.
	^ to := reader next