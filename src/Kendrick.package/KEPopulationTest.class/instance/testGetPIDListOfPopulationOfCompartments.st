as yet unclassified
testGetPIDListOfPopulationOfCompartments
	|aNewPopulation|
	aNewPopulation := self createAPopulationOfCompartments. 
	self assert: (aNewPopulation nodes size) equals: 3.
	self assert: (aNewPopulation getPIDList) equals: #(0).  
	