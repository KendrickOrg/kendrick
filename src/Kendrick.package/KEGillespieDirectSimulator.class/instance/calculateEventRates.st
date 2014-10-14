as yet unclassified
calculateEventRates
	|cityRates i|
	cityRates := Array new: (model subPopulations size).
	i := 1.
	model subPopulations do: [ :each|
		each rates: (OrderedCollection new)
		 ].
	model subPopulations do: [ :each| 
		model currentSubPopulation: each.
		model setIndex: each populationID.
		"pid isArray ifTrue: [ model setIndex: (pid last) ]."
		each events do: [ :e| |r|
			r := e evaluateAtPopulationLevelWithModel: model.
			each rates add: r
			].
		cityRates at: i put: each rates sum.
		i := i + 1
		].
	^ cityRates