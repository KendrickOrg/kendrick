tests-as yet unclassified
testGenerateTensorSum2
	| tmp1 tmp2 |
	tmp1 := KEModelPart new.
	tmp1 addAttribute: #status value: #(#S #I #R).
	tmp2 := KEModel new.
	tmp2
		addAttribute: #species
		value: #(#mosquito #reservoir1 #reservoir2).
	tmp1
		addTransitionFrom: {(#status -> #S)}
			to: {(#status -> #I)}
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: {(#status -> #I)}
			to: {(#status -> #R)}
			probability: [ :arg2 | arg2 atParameter: #gamma ].
	self
		assert: tmp2 transitions size equals: 9;
		assert: (tmp1 generateTensorSum: tmp2 transitions) size equals: 6