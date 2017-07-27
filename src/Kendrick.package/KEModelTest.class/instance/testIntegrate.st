tests
testIntegrate
	| tmp1 tmp2 |
	tmp1 := KEModel new population: (KEPopulation size: 1000).
	tmp2 := KEModelPart new.
	tmp2
		addAttribute: #status value: #(#S #I #R);
		addTransitionFrom: {(#status -> #S)}
			to: {(#status -> #I)}
			probability: [ :arg1 | arg1 atParameter: #lambda ];
		addTransitionFrom: {(#status -> #I)}
			to: {(#status -> #R)}
			probability: [ :arg2 | arg2 atParameter: #gamma ];
		addParameters: {#beta . #gamma};
		addParameter: #lambda
			value: [ :arg3 | (arg3 atParameter: #beta) * (arg3 atCompartment: {(#status -> #I)}) ].
	tmp1 integrate: tmp2.
	self
		should: tmp1 parameters size >= 3;
		assert: tmp1 transitions size equals: 2;
		assert: tmp1 attributes size equals: 1;
		assert: tmp1 compartments size equals: 3