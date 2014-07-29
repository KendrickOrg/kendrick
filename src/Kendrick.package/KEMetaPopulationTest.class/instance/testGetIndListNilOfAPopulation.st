as yet unclassified
testGetIndListNilOfAPopulation
	|population|
	population := self createAMetaPopulationWith2Levels.
	self assert: (population indList) equals: nil
	