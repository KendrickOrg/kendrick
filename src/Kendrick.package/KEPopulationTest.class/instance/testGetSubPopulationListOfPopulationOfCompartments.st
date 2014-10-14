as yet unclassified
testGetSubPopulationListOfPopulationOfCompartments
	|aNewPopulation|
	aNewPopulation := self createAPopulationOfCompartments. 
	self assert: (aNewPopulation nbOfSubPopulations) equals: 3.
	self assert: (aNewPopulation name) equals: #0.  
	