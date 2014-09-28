as yet unclassified
calculateEventRates
	|cityRates i|
	cityRates := Array new: (model populationIDs size).
	i := 1.
	model populationIDs do: [ :pid|
		(model population at: pid) rates: (OrderedCollection new)
		 ].
	model populationIDs do: [ :pid| 
		model currentPopulationID: pid.
		pid isArray ifTrue: [ model setIndex: (pid last) ].
		(model population at: pid) events do: [ :each| |r|
			r := each evaluateAtPopulationLevelWithModel: model.
			(model population at: pid) rates add: r
			].
		cityRates at: i put: (model population at: pid) rates sum.
		i := i + 1
		].
	^ cityRates