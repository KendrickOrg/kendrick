tests-as yet unclassified
testSplitStatus
	|twoStrains model|
	twoStrains := KEConcern dependOn: self sirConcern.
	twoStrains transitions: self sirConcern transitions.
	twoStrains splitStatus: { #(I). #strains->#(1 2) }.

	self assert: (twoStrains atAttribute: #status) size equals: 5.
	self assert: (twoStrains transitions size) equals: 12.
	
	model := KEModel new population: (KEPopulation new).
	model integrate: self sirConcern.
	model integrate: twoStrains.
	
	self assert: (model transitions) size equals: 9.