accessing
removeIndividual: ind
	super removeIndividual: ind.
	graphs do: [ :g| g networkOfIndividuals ifTrue: [ g releaseNode: ind ] ]