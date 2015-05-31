accessing
updateIndividual: ind
	graphs do: [ :g| g updateNode: ind ].
	super updateIndividual: ind.