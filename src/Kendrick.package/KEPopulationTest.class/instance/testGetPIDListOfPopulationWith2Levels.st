as yet unclassified
testGetPIDListOfPopulationWith2Levels
	|aNewPopulation|
	aNewPopulation := self createAPopulationWith2Levels.
	
	self assert: (aNewPopulation nodes size) equals: 3.
	self assert: (aNewPopulation getPIDList) equals: #((0 1) (0 2) (0 3)).  
	