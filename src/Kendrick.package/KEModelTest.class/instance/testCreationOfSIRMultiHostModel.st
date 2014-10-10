tests
testCreationOfSIRMultiHostModel
	|model|
	model := self createSIRMultiHostModel.
	self assert: (model population isPopulation) equals: false.
	self assert: (model population getNbSubPopulations) equals: 3.
	self assert: (model population getNbIndividuals) equals: 13000.
	self assert: (model population getNbIndividualsOfCompartment: #S) equals: 12997.
	
	self assert: (model equations size) equals: 3.
	self assert: (model population getPopulationIDs) equals: #(#(0 1) #(0 2) #(0 3)).
	self assert: ((model population at: #(1)) isPopulation) equals: true.
	self assert: ((model population at: #(1)) at: #S) currentNbIndividuals equals: 9999