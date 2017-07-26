accessing
to: aCompartment
	|reader|
	(aCompartment isDictionary) "| (aCompartment isSymbol)" ifTrue: [ ^ to := aCompartment ].
	aCompartment = #empty ifTrue: [ ^ self to: { #status -> #empty } ].
	(aCompartment isArray) ifTrue: [ ^ to := Dictionary newFrom: aCompartment ].
	(reader := STONReader on: aCompartment readStream) allowComplexMapKeys: true.
	^ to := reader next