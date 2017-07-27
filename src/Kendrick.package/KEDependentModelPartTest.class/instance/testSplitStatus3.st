tests-as yet unclassified
testSplitStatus3
	| tmp1 tmp2 |
	tmp1 := KEModelPart dependOn: self sirConcern.
	tmp1
		transitions: self sirConcern transitions;
		splitStatus:
			{#(#S #I).
			(#index -> (1 to: 2))}.
	self
		assert: (tmp1 atAttribute: #status) size equals: 7;
		assert: tmp1 transitions size equals: 16.
	tmp2 := KEModel new population: KEPopulation new.
	tmp2
		integrate: self sirConcern;
		integrate: tmp1.
	self assert: tmp2 transitions size equals: 11