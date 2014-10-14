as yet unclassified
updateIndividuals
	model subPopulations do: [ :each|
		|indList|
		model currentSubPopulation: each.
		"subPop := model population at: pid."
		indList := each indList.
		indList do: [ :ind|
			(ind isAlive) & (ind nextStatus isNotNil) ifTrue: [ ind updateStatus: model ]
			]
		].
	