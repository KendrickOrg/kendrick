as yet unclassified
calculateEventRates
	model subPopulations do: [ :pop|
		pop rates: (OrderedCollection new)
		 ].
	model subPopulations do: [ :pop| 
		model currentSubPopulation: pop.
		model setIndex: pop populationID. 
		"pid isArray ifTrue: [ model setIndex: (pid last) ]."
		pop events do: [ :each| |r|
			r := each evaluateAtPopulationLevelWithModel: model.
			pop rates add: r
			]
		]
	
	