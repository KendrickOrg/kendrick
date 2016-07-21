tests-as yet unclassified
testProject
	|model concern|
	model := KEModel new population: (KEPopulation new)..
	model integrate: self sirConcern.
	model integrate: self multiHostConcern.
	concern := KEModelPart dependOn: (self sirConcern).

	self assert: (concern project: model transitions) size equals: 6.