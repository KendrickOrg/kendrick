tests
testEvaluateProbability
	| tmp1 tmp2 tmp3 |
	tmp2 := KEModel new population: (KEPopulation size: 10001).
	tmp2
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 10000 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1.
	tmp1 := KETransition
		from: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :arg1 :arg2 :arg3 | (tmp2 atParameter: #beta) * arg1 * arg2 ].
	tmp2
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)}.
	tmp3 := tmp1 probability
		value: (tmp2 atCompartment: tmp1 from)
		value: (tmp2 atCompartment: tmp1 to)
		value: 0.
	self assert: tmp3 equals: 52