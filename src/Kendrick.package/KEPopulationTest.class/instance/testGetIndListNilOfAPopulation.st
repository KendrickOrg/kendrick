as yet unclassified
testGetIndListNilOfAPopulation
	|population|
	population := self createAPopulationWith2Levels.
	self assert: (population indList) equals: nil
	