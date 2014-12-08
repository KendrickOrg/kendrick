accessing
updateIndividual: ind
	graphs do: [ :g| g networkOfIndividuals ifTrue: [ g updateNode: ind ] ].
	super updateIndividual: ind.