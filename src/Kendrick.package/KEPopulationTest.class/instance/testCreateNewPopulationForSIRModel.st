tests
testCreateNewPopulationForSIRModel
	self assert: (anSIRPopulationWith1000Individuals at: #S) isCompartment.  
	self assert: (anSIRPopulationWith1000Individuals at: #S) status equals: #S
