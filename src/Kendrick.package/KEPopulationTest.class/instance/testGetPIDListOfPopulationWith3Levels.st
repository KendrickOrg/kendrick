as yet unclassified
testGetPIDListOfPopulationWith3Levels
	|aNewPopulation|
	aNewPopulation := self createAPopulationWith3Levels.
	self assert: (aNewPopulation nodes size) equals: 3.
	self assert: (aNewPopulation getPIDList) equals: #((0 1 1) (0 1 2) (0 1 3) (0 2 1) (0 2 2) (0 3 1) (0 3 2) (0 3 3) (0 3 4)).  
	