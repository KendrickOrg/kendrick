tests
testCreationOfSIRSimpleModel
	|model|
	model := self createSIRSimpleModel.
	self assert: (model population isPopulation) equals: true.
	self assert: (model population nbOfIndividuals) equals: 100000.
	self assert: (model population nbOfSubPopulations) equals: 3.
	self assert: (model equations size) equals: 3.
	self assert: (model population name) equals: #0