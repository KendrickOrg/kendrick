as yet unclassified
updateIndividuals
	model subPopulations do: [ :each|
		|indList|
		model currentSubPopulation: each.
		"subPop := model population at: pid."
		indList := each individuals.
		indList do: [ :ind|
			(ind isAlive) & (ind nextStatus isNotNil) ifTrue: [ ind updateStatus: model ]
			]
		].
	