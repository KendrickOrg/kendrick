tests-as yet unclassified
testRemainingMatrixAfterProjecting
	| tmp1 tmp2 |
	tmp1 := KEModel new population: KEPopulation new.
	tmp1
		integrate: self sirConcern;
		integrate: self multiHostConcern.
	tmp2 := KEModelPart dependOn: self sirConcern.
	self
		assert: (tmp2 remainingMatrixAfterProjecting: tmp1 transitions) size
		equals: 4