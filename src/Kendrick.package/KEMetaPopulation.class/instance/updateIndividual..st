accessing
updateIndividual: ind
	self graph ifNotNil: [  
		self graph updateNode: ind
		].
	super updateIndividual: ind