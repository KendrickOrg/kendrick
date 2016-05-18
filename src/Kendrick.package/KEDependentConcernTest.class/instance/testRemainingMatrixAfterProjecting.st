tests-as yet unclassified
testRemainingMatrixAfterProjecting
	|model concern|
	model := KEModel new population: (KEPopulation new)..
	model integrate: self sirConcern.
	model integrate: self multiHostConcern.
	concern := KEConcern dependOn: (self sirConcern).
	
	self assert: (concern remainingMatrixAfterProjecting: model transitions) size equals: 4. 
	