tests
testCreationOfSIRMultiHostModel
	|model|
	model := self createSIRMultiHostModel.
	self assert: (model population isPopulation) equals: false.
	self assert: (model population nbOfSubPopulations) equals: 3.
	self assert: (model population nbOfIndividuals) equals: 13000.
	self assert: (model population nbOfIndividualsOf: #S) equals: 12997.
	
	self assert: (model equations size) equals: 3.
	self assert: (model subPopulations size) equals: 3.
	self assert: ((model subPopulations first) isPopulation) equals: true.
	self assert: (model subPopulations first at: #S) currentNbIndividuals equals: 9999