as yet unclassified
testGetPIDListOfPopulationWith2Levels
	|aNewPopulation|
	aNewPopulation := self createAMetaPopulationWith2Levels.
	
	self assert: (aNewPopulation getNbSubPopulations) equals: 3.
	self assert: (aNewPopulation populationIDs) equals: #(#(0 1) #(0 2) #(0 3)).  
	