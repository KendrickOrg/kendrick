accessing
addIndividual: ind
	super addIndividual: ind.
	self graph ifNotNil: [ 
		graph newNode: ind
		 ]