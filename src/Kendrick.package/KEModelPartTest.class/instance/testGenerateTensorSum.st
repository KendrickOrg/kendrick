tests-as yet unclassified
testGenerateTensorSum
	| tmp1 tmp2 |
	tmp1 := KEModelPart new.
	tmp1 addAttribute: #status value: #(#S #I #R).
	tmp2 := KEModel new.
	tmp1
		addTransitionFrom: {(#status -> #S)}
			to: {(#status -> #I)}
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: {(#status -> #I)}
			to: {(#status -> #R)}
			probability: [ :arg2 | arg2 atParameter: #gamma ].
	self
		assert: tmp2 transitions size equals: 0;
		assert: (tmp1 generateTensorSum: tmp2 transitions) size equals: 2