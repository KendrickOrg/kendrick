tests-as yet unclassified
testSplitStatus3
	|twoStrains model|
	twoStrains := KEModelPart dependOn: self sirConcern.
	twoStrains transitions: self sirConcern transitions.
	twoStrains splitStatus: { #(S I). #index->(1 to: 2) }.

	self assert: (twoStrains atAttribute: #status) size equals: 7.
	self assert: (twoStrains transitions size) equals: 16.
	
	model := KEModel new population: (KEPopulation new).
	model integrate: self sirConcern.
	model integrate: twoStrains.
	
	self assert: (model transitions) size equals: 11.