accessing
addIndividual: ind
	super addIndividual: ind.
	graphs do: [ :g|
		g networkOfIndividuals ifTrue: [ g newNode: ind ]
		 ]