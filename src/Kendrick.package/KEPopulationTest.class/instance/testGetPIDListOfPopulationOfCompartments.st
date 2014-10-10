as yet unclassified
testGetPIDListOfPopulationOfCompartments
	|aNewPopulation|
	aNewPopulation := self createAPopulationOfCompartments. 
	self assert: (aNewPopulation getNbSubPopulations) equals: 3.
	self assert: (aNewPopulation populationIDs) equals: #(0).  
	