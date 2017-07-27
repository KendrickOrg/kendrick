tests-as yet unclassified
testProject
	| tmp1 tmp2 |
	tmp1 := KEModel new population: KEPopulation new.
	tmp1
		integrate: self sirConcern;
		integrate: self multiHostConcern.
	tmp2 := KEModelPart dependOn: self sirConcern.
	self assert: (tmp2 project: tmp1 transitions) size equals: 6