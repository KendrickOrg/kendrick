accessing
removeIndividual: ind
	super removeIndividual: ind.
	self graph ifNotNil: [  
		self graph releaseNode: ind
		]