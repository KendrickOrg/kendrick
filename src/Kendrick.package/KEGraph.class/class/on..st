as yet unclassified
on: population
	|graph|
	graph := KEGraph new.
	population subPopulationNames size = 0
	ifTrue: [ graph nodes: (population nbOfSubPopulations) ]
	ifFalse: [ graph nodes: (population subPopulationNames) ].
	population graph: graph.
	^ graph