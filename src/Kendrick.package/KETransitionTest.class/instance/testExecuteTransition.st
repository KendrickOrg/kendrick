tests
testExecuteTransition
	| tmp1 tmp2 |
	tmp1 := KETransition
		from: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :arg1 :arg2 :arg3 | (arg3 atParameter: #beta) * arg1 * arg2 ].
	tmp2 := KEModel new population: (KEPopulation size: 10001).
	tmp2
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 10000 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)}.
	tmp1 executeOn: tmp2 times: 1.
	self
		assert: (tmp2 atCompartment: '{#status:#S}') equals: 9999;
		assert: (tmp2 atCompartment: '{#status:#I}') equals: 2