tests-as yet unclassified
testSplitStatus
	| tmp1 tmp2 |
	tmp1 := KEModelPart dependOn: self sirConcern.
	tmp1
		transitions: self sirConcern transitions;
		splitStatus:
			{#(#I).
			(#index -> #(1 2))}.
	self
		assert: (tmp1 atAttribute: #status) size equals: 5;
		assert: tmp1 transitions size equals: 12.
	tmp2 := KEModel new population: KEPopulation new.
	tmp2
		integrate: self sirConcern;
		integrate: tmp1.
	self assert: tmp2 transitions size equals: 9