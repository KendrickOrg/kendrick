as yet unclassified
on: population
	|graph|
	graph := KEGraph new.
	population subPopulationNames 
	ifNil: [ graph nodes: (population getNbSubPopulations) ]
	ifNotNil: [ graph nodes: (population subPopulationNames) ].
	
	^ graph