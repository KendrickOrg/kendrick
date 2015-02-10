accessing
removeIndividual: ind
	super removeIndividual: ind.
	graphs do: [ :g| g releaseNode: ind ]