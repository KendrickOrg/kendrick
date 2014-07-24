as yet unclassified
calculateMovementEventRates: events
	|rates|
	rates := Dictionary new.
	model populationIDs do: [ :pid| rates at: pid put: (Dictionary new) ].
	events keysAndValuesDo: [ :pid :list|
		(rates at: pid) at: pid put: (OrderedCollection new).
		list do: [ :each| ((rates at: pid) at: pid) add: (each rate number) ]
		].
	^ rates