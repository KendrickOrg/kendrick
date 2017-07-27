tests-as yet unclassified
testSplitStatus
	| tmp1 |
	tmp1 := KEModelPart extends: self sirConcern.
	tmp1
		splitStatus:
			{#(#I).
			(#strains -> #(1 2))}.
	self
		assert: (tmp1 atAttribute: #status) size equals: 5;
		assert: tmp1 transitions size equals: 12