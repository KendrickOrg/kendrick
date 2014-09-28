as yet unclassified
calculateEventRates
	model populationIDs do: [ :pid|
		(model population at: pid) rates: (OrderedCollection new)
		 ].
	model populationIDs do: [ :pid| 
		model currentPopulationID: pid.
		pid isArray ifTrue: [ model setIndex: (pid last) ].
		(model population at: pid) events do: [ :each| |r|
			r := each evaluateAtPopulationLevelWithModel: model.
			(model population at: pid) rates add: r
			]
		]
	
	