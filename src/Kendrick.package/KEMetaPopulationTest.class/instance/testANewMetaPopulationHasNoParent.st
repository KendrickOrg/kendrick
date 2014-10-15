tests
testANewMetaPopulationHasNoParent
	|population|
	population := KEMetaPopulation new.
	self assert: population parent isNil