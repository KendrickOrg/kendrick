as yet unclassified
testGetIndListOfAPopulation
	|population|
	population := self createAPopulationOfCompartments.
	self assert: (population indList size) equals: 100000
	