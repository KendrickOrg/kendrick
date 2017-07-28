tests-as yet unclassified
testRemainingMatrixAfterProjecting2
	|model concern |
	model := KEModel new population: (KEPopulation new).
	model integrate: self sirConcern.
	model integrate: self spatialConcern.
	concern := KEModelPart dependOn: (self sirConcern).
	self assert: (concern remainingMatrixAfterProjecting: model transitions) size equals: 5. 
	