as yet unclassified
calculateMovementEventRates: events
	|rates|
	rates := Dictionary new.
	model populationIDs do: [ :pid| rates at: pid put: (OrderedCollection new) ].
	model populationIDs do: [ :pid|
		model currentPopulationID: pid.
		pid isArray ifTrue: [ model setIndex: (pid last) ].
		(events at: pid) do: [ :each|
			(rates at: pid) add: (each evaluateWithModel: model)
			 ]
		 ].
	^ rates
	