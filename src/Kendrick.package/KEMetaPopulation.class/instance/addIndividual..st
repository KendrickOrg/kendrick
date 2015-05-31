accessing
addIndividual: ind
	super addIndividual: ind.
	graphs do: [ :g| g newNode: ind ]